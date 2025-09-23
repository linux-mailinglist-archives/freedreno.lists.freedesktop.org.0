Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 792C1B95562
	for <lists+freedreno@lfdr.de>; Tue, 23 Sep 2025 11:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BD510E5DC;
	Tue, 23 Sep 2025 09:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="3sSIBJSx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF29E10E5DD
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 09:55:43 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id
 4fb4d7f45d1cf-62fd0d29e2bso5855929a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 02:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1758621342; x=1759226142; darn=lists.freedesktop.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJ4iR0ikwChD7GAZnfT4r7240QnDqgcDQ/DHGsIuO5k=;
 b=3sSIBJSx2cc/Jy60MFk86rBWbaJp3FJwq7PgFk9CQAJjN4cw9vAvYy2aISD1WEsr7v
 oH/6B6J2BDPYbCKOq0sqgWMYRMIlvvDN+qC8FEtqrCMXGPADmZPbi/3EgFJb0fAQKIoz
 036qAGntpGxmFNSW4ix2GJQVYx7GmZxGfLLlRaJbL/O0pZSK0fDJxgX7J2oav3JxF67j
 wHnYpZTZKZBnTSnx+Bvxgnm0/NplYInyrsmEXLb0sFNy4Yt3dQPOeOluV6lXM9uCG3yT
 3tCs1pnHRQEPnLGYy3RjSbeO3jeusvsqwJtkGPqnW1gLFMCfgUerJHszTrEdWaPTnyxG
 mt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758621342; x=1759226142;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rJ4iR0ikwChD7GAZnfT4r7240QnDqgcDQ/DHGsIuO5k=;
 b=m77ah6sQRhTbXSZzJmA91LmuWJ+QpgT0Dk0CdWVJ3DydRtUtAVatr4bvG+gbvUGu4a
 1poiU8dYSeoGs1lRsb/sfs2/V5N+otaDtb0X3u3UszIT97q1025Bn992cCcyQu6vB1qs
 lWjeVMALGVR5ekiHyT7rRddvEnQ/iUIf15iic8nJl1sJlVJYoAQ7Kertd8/qVlFFxZlR
 sXyjR8/9AY9Na1PnLwUdLX1UtsfiUyMdQARwIJvOGzAjQfgt4l0OaxaHN6ren7upMQB9
 JDvYWSvCLOd6d4c33IGAEf5+E116oDMEAAojSx3noTAbugecOgZWljoptc474r/m2xAf
 q+AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxhLpYjz3V31/HkJznSULddI7dqvm8eJCt3SAysff60ekxvWs7K+TvG/vuPUmsXb8oSrJpm69Hl4Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTpYSSDj3cDpXYSMQMkvqGY+AtfcKajG3akbf7PR8xGC6Yyvky
 RfWYNUnxsMp1fe/EDksdiPbQX70o4KWeol38jBLFLZ5qjeALjILUhxRF3JjSAuASYqc=
X-Gm-Gg: ASbGncvzEOoWbBs8UG/JhQfkCWihtF9JJbsOyZrsORuWcX+SaDc4qGGZLDGsjyNTms7
 WexN9n5A9A2CpeqVJS1qSPDJINOhN2xkIUbWwisDUKVTJ5oIVLGOThRSeLNlgqCC6c7Ha1qJZhT
 BmQuao5Qfm9BMn/PTHg7QklcN0Wtff+vMsFqmetLYmHfLyAioVu3bz6PbTM7PNRcaHoTw5weDvs
 U4+MYHnRCrNKvywwrxa7ofjqqzdY2kFjlpUK17YScojlYbCTmlwLanDzQZmsNMz2bE79Z10vaVw
 farU4mntjAgyzA7JJPVZXSyTjommJNhKNZizC/M/ZgYTdMFiSnNkwxq1snqESZM3Xmh55VrJsun
 l17TT0MqsKTUy/qNmmbrPKYx+8+uQL9L0kOH1f3eLHf592b+fK+uKP52OCJ+SrNAS70C/
X-Google-Smtp-Source: AGHT+IF4qTxhg5Hb9sQ/tJAzBa4Ees7FfG50FOAI9GBuf35fyxLYwKPlFRuv+uHkCbA78L9NSJbk0w==
X-Received: by 2002:a05:6402:4389:b0:634:4e0:8360 with SMTP id
 4fb4d7f45d1cf-6346779a012mr1708846a12.2.1758621342052; 
 Tue, 23 Sep 2025 02:55:42 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl.
 [144.178.202.139]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62fa5cfa6f2sm10771105a12.6.2025.09.23.02.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 02:55:41 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 11:55:41 +0200
Message-Id: <DD038IVOWESM.24X3EZZXH3UE@fairphone.com>
To: "Pavel Machek" <pavel@ucw.cz>, <barnabas.czeman@mainlining.org>
Cc: "Bjorn Andersson" <andersson@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Stephan Gerhold" <stephan@gerhold.net>,
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Lee Jones" <lee@kernel.org>, "Joerg Roedel"
 <joro@8bytes.org>, "Will Deacon" <will@kernel.org>, "Robin Murphy"
 <robin.murphy@arm.com>, "Konrad Dybcio" <konradybcio@kernel.org>, "Sean
 Paul" <sean@poorly.run>, "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Adam Skladowski" <a_skl39@protonmail.com>, "Sireesh
 Kodali" <sireeshkodali@protonmail.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Abhinav Kumar" <abhinav.kumar@linux.dev>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, "Srinivas Kandagatla"
 <srini@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <iommu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <phone-devel@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <linux@mainlining.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: qcom: Add Xiaomi Redmi 3S
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250831-msm8937-v7-0-232a9fb19ab7@mainlining.org>
 <20250831-msm8937-v7-6-232a9fb19ab7@mainlining.org>
 <aNGLPdmOyh/pfroq@duo.ucw.cz>
 <97ee369f6ffbe42c72c57ebd72887b23@mainlining.org>
 <aNJKniJ46YuUsbQ+@duo.ucw.cz>
In-Reply-To: <aNJKniJ46YuUsbQ+@duo.ucw.cz>
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Pavel and Barnabas,

On Tue Sep 23, 2025 at 9:22 AM CEST, Pavel Machek wrote:
> Hi!
>> > Hi!
>> >=20
>> > > +	led-controller@45 {
>> > > +		compatible =3D "awinic,aw2013";
>> > > +		reg =3D <0x45>;
>> > > +		#address-cells =3D <1>;
>> > > +		#size-cells =3D <0>;
>> > > +
>> > > +		vcc-supply =3D <&pm8937_l10>;
>> > > +		vio-supply =3D <&pm8937_l5>;
>> > > +
>> > > +		led@0 {
>> > > +			reg =3D <0>;
>> > > +			function =3D LED_FUNCTION_STATUS;
>> > > +			led-max-microamp =3D <5000>;
>> > > +			color =3D <LED_COLOR_ID_RED>;
>> > > +		};
>> > > +
>> > > +		led@1 {
>> > > +			reg =3D <1>;
>> > > +			function =3D LED_FUNCTION_STATUS;
>> > > +			led-max-microamp =3D <5000>;
>> > > +			color =3D <LED_COLOR_ID_GREEN>;
>> > > +		};
>> > > +
>> > > +		led@2 {
>> > > +			reg =3D <2>;
>> > > +			function =3D LED_FUNCTION_STATUS;
>> > > +			led-max-microamp =3D <5000>;
>> > > +			color =3D <LED_COLOR_ID_BLUE>;
>> > > +		};
>> > > +	};
>> > > +};
>> >=20
>> > That's single, 3-color LED, right? Please see LED multicolor support.
>> As far as i know aw2013 driver does not have multicolor support.
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree=
/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
>
> I believe that needs to be fixed before more bugs are added on top to
> work around that problem...
>
> ...and before that bug is cemented in the ABI.

Honestly I don't think it's reasonable to expect people contributing dts
to then first start patching existing LED drivers and adding support for
x y or z to it, and block dts addition on that.

At least in postmarketOS the user space components we have (e.g.
feedbackd) detect the LED things (and most others) automatically since
various devices have various different setups. So once/if aw2013 gets
multicolor support, the dts can be updated without problems.

Sure, maybe today changing something on the N900 which would change
sysfs paths is not the best idea because people will probably have 10+
years of random shell scripts lying around, but nowadays we usually have
better ways of abstraction that can handle that.

Regards
Luca

>
> Best regards,
> 								Pavel

