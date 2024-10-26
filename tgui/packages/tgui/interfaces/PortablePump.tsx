import { BooleanLike } from 'common/react';

import { useBackend } from '../backend';
import { Button, LabeledList, Section, Slider } from '../components';
import { Window } from '../layouts';
import { PortableBasicInfo } from './common/PortableAtmos';

type Data = {
  direction: BooleanLike;
  target_pressure: number;
  default_pressure: number;
  min_pressure: number;
  max_pressure: number;
};

export const PortablePump = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    direction,
    target_pressure,
    default_pressure,
    min_pressure,
    max_pressure,
  } = data;
  return (
    <Window width={330} height={375}>
      <Window.Content scrollable>
        <PortableBasicInfo />
        <Section
          title="Pump"
          buttons={
            <Button
              icon={direction ? 'sign-in-alt' : 'sign-out-alt'}
              selected={direction}
              onClick={() => act('direction')}
            >
              {direction ? 'In' : 'Out'}
            </Button>
          }
        >
          <LabeledList>
            <LabeledList.Item label="Output">
              <Slider
                mt="0.4em"
                animated
                minValue={min_pressure}
                maxValue={max_pressure}
                value={target_pressure}
                unit="kPa"
                stepPixelSize={0.3}
                onChange={(e, value) =>
                  act('pressure', {
                    pressure: value,
                  })
                }
              />
            </LabeledList.Item>
            <LabeledList.Item label="Presets">
              <Button
                icon="minus"
                disabled={target_pressure === min_pressure}
                onClick={() =>
                  act('pressure', {
                    pressure: 'min',
                  })
                }
              />
              <Button
                icon="sync"
                disabled={target_pressure === default_pressure}
                onClick={() =>
                  act('pressure', {
                    pressure: 'reset',
                  })
                }
              />
              <Button
                icon="plus"
                disabled={target_pressure === max_pressure}
                onClick={() =>
                  act('pressure', {
                    pressure: 'max',
                  })
                }
              />
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
