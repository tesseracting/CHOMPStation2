import { BooleanLike } from 'common/react';

import { useBackend } from '../backend';
import { Button, Flex, Section } from '../components';
import { Window } from '../layouts';

type Data = {
  doors_open: BooleanLike;
  fire_mode: BooleanLike;
  floors: floor[];
};

type floor = {
  id: number;
  ref: string;
  queued: BooleanLike;
  target: BooleanLike;
  current: BooleanLike;
  label: string;
  name: string;
};

export const Turbolift = (props) => {
  const { act, data } = useBackend<Data>();

  const { floors, doors_open, fire_mode } = data;

  return (
    <Window width={480} height={fire_mode ? 285 : 260}>
      <Window.Content>
        <Section
          title="Floor Selection"
          className={fire_mode ? 'Section--elevator--fire' : null}
          buttons={
            <>
              <Button
                icon={doors_open ? 'door-open' : 'door-closed'}
                selected={doors_open && !fire_mode}
                color={fire_mode ? 'red' : null}
                onClick={() => act('toggle_doors')}
              >
                {doors_open
                  ? fire_mode
                    ? 'Close Doors (SAFETY OFF)'
                    : 'Doors Open'
                  : 'Doors Closed'}
              </Button>
              <Button
                icon="exclamation-triangle"
                color="bad"
                onClick={() => act('emergency_stop')}
              >
                Emergency Stop
              </Button>
            </>
          }
        >
          {!fire_mode || (
            <Section
              className="Section--elevator--fire"
              textAlign="center"
              title="FIREFIGHTER MODE ENGAGED"
            />
          )}
          <Flex wrap="wrap">
            {floors.map((floor) => (
              <Flex.Item basis="100%" key={floor.id}>
                <Flex align="center" justify="space-around">
                  <Flex.Item basis="22%" textAlign="right" mr="3px">
                    {floor.label || 'Floor #' + floor.id}
                  </Flex.Item>
                  <Flex.Item basis="8%" textAlign="left">
                    <Button
                      icon="circle"
                      color={
                        floor.current
                          ? 'red'
                          : floor.target
                            ? 'green'
                            : floor.queued
                              ? 'yellow'
                              : null
                      }
                      onClick={() => act('move_to_floor', { ref: floor.ref })}
                    />
                  </Flex.Item>
                  <Flex.Item basis="50%" grow={1}>
                    {floor.name}
                  </Flex.Item>
                </Flex>
              </Flex.Item>
            ))}
          </Flex>
        </Section>
      </Window.Content>
    </Window>
  );
};
