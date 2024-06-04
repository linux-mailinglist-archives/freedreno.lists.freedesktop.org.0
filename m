Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8235B8FB455
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 15:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A9310E493;
	Tue,  4 Jun 2024 13:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="VaMPbD1d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A064910E492
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 13:50:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-421555a4454so1213875e9.3
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 06:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717509050; x=1718113850;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJZIlN4XgnK9tDXCSYK6tAuRSp4UM2QNTlG/GA4rHi0=;
 b=VaMPbD1dONfwuRlzxuXdpTh2t6cmtdRL4kBbmL5awkERJ62uEGxVqepQWmVCURvrVX
 MNYPvhckQeFVL/T0N+A4BSeEajgZaUQAFD0+94g/SEdLzdnWXIqkL4vqt7wJeQ0/VV96
 IM2eX6FWnDT7cmTSgD8Ka+DN9mYHjPFoYVLYKoWlp51q0P5PpIMHPjZKWh67wUsIIlR/
 zgRUat8gF3O3oKIuCtb1hXmzZ7Z2nrRMRLE1G655cMp7FQYI+XG4tkZ73rdsmo2TFbsy
 3ucnZPA6jSbNfdZUR/Ymqk73vDrt3xVzNaxVjkcJYPh5fCis6aFiZC/AXsJx2GSHh6/8
 ltlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717509050; x=1718113850;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lJZIlN4XgnK9tDXCSYK6tAuRSp4UM2QNTlG/GA4rHi0=;
 b=qMnDDUUOGm7ADGwWyQTKiG2Dsf4lasJ+//ffQ5LGrhOvrVkNP8r5D2YP4QQjHSAlpF
 BNEb+OFHi8MVa3TXo1rlP93sM391Biedf3vSNUvdUMo2MTKlyiJulFKWBpv+fcaJLGNL
 A+ULoaTNGLezgWyZUfEZ51ekVjeCHoKfadBRrIFqHxZUbmvHBUNMm5Nho0K2HP7JQP8X
 /Wnh3lvT12n8r3dFdZCiXDB8N4YgtlURq4AyDTQKF3H557pxICUAXJBKMKGJev+qFGyI
 Z0/IlACQwxO7IA6rUzhNaRDFyv+YQB6qXQX8cCNAwDRlGdWzIYgoUhHFDtzAXY+KUNc/
 1wYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAKYJhYoGtlCBVIJxxcVsIE0qXhidl4Tw7v44dMpDJKn3u6YIs7uSDEd6wscxhNh2ih4Uuv7UeQtGCotLvv1LaMCXc2S/MthLnZ2U/9VAr
X-Gm-Message-State: AOJu0YxJ77FpXAOe7J1S+215ijX6P0x5G0pF7X9Utt2kX4bVSbj15vbg
 vFivBIMWxBTzHwh7Jxq6WQx5I+wgYoD5goYAydcMyA4GAjb/+19b5iryR64NGKo=
X-Google-Smtp-Source: AGHT+IHQZBq9gGi04QHPhWrIeVoppGhM4cBpGMsNRG5Tm6dNoMEyFQ9kGxrHF/G1xHo1JxNtiYUrpA==
X-Received: by 2002:a05:600c:c09:b0:418:ee2:5911 with SMTP id
 5b1f17b1804b1-4213d3068f9mr54739485e9.28.1717509050485; 
 Tue, 04 Jun 2024 06:50:50 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42133227f8asm139569755e9.19.2024.06.04.06.50.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 06:50:50 -0700 (PDT)
Message-ID: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Date: Tue, 4 Jun 2024 15:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH v2 0/4] HDMI TX support in msm8998
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

DT bits required for HDMI TX support in APQ8098 (msm8998 cousin)

$ make -j20 dtbs_check
  DTC_CHK arch/arm64/boot/dts/qcom/msm8998-mtp.dtb
/home/mgonzalez/linux/arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pcie@1c00=
000: False schema does not allow {'compatible': ['qcom,pcie-msm8998', 'qc=
om,pcie-msm8996'], 'reg': [[29360128, 8192], [452984832, 3869], [45298870=
4, 168], [454033408, 1048576]], 'reg-names': ['parf', 'dbi', 'elbi', 'con=
fig'], 'device_type': ['pci'], 'linux,pci-domain': [[0]], 'bus-range': [[=
0, 255]], '#address-cells': [[3]], '#size-cells': [[2]], 'num-lanes': [[1=
]], 'phys': [[36]], 'phy-names': ['pciephy'], 'status': ['okay'], 'ranges=
': [[16777216, 0, 0, 455081984, 0, 1048576], [33554432, 0, 456130560, 456=
130560, 0, 13631488]], '#interrupt-cells': [[1]], 'interrupts': [[0, 405,=
 4]], 'interrupt-names': ['msi'], 'interrupt-map-mask': [[0, 0, 0, 7]], '=
interrupt-map': [[0, 0, 0, 1, 1, 0, 0, 135, 4], [0, 0, 0, 2, 1, 0, 0, 136=
, 4], [0, 0, 0, 3, 1, 0, 0, 138, 4], [0, 0, 0, 4, 1, 0, 0, 139, 4]], 'clo=
cks': [[37, 94], [37, 91], [37, 92], [37, 93], [37, 95]], 'clock-names': =
['pipe', 'aux', 'cfg', 'bus_master', 'bus_slave'], 'power-domains': [[37,=
 0]], 'iommu-map': [[256, 38, 5248, 1]], 'perst-gpios': [[39, 35, 1]], 'p=
cie@0': {'device_type': ['pci'], 'reg': [[0, 0, 0, 0, 0]], 'bus-range': [=
[1, 255]], '#address-cells': [[3]], '#size-cells': [[2]], 'ranges': True}=
, '$nodename': ['pcie@1c00000']}
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
/home/mgonzalez/linux/arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: pcie@1c00=
000: Unevaluated properties are not allowed ('#address-cells', '#interrup=
t-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'in=
terrupt-map-mask', 'linux,pci-domain', 'num-lanes', 'pcie@0', 'ranges' we=
re unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
/home/mgonzalez/linux/arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@c0120=
00: 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
/home/mgonzalez/linux/arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: clock-con=
troller@c8c0000: clocks: [[34, 0], [37, 178], [150, 1], [150, 0], [151, 1=
], [151, 0], [152], [0], [0], [0], [37, 184]] is too long
	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#


Arnaud Vrac (1):
  arm64: dts: qcom: add HDMI nodes for msm8998

Marc Gonzalez (3):
  dt-bindings: display/msm: hdmi: add qcom,hdmi-phy-8998
  dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
  arm64: dts: qcom: msm8998: add HDMI GPIOs

 Documentation/devicetree/bindings/display/msm/hdmi.yaml      |  26 +++++=
+++++-
 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |   1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi                        | 128 +++++=
+++++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 152 insertions(+), 3 deletions(-)

--=20
2.34.1
