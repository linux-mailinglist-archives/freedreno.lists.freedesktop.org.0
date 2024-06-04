Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7328FB45A
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 15:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9113D10E497;
	Tue,  4 Jun 2024 13:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="dp3PV+VU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC65F10E495
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 13:50:54 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4213b94b8b5so21762135e9.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717509053; x=1718113853;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1CmU0DTF3wr3QsPtiX/X8uKixsYvsbrBSlvb1F0M3SQ=;
 b=dp3PV+VUPftrvOLV/vlYQHY36SUBwUWYUWgrg5Pa5a9IMEuBhhcY1OiZolZgNSbub8
 NM7nZmrvhyAPCNb6gs0mRHeuLHYhC3vZ3+ONPgTsoW1RJs4XvNWipy0kn16Xnt8Jc5fC
 YN4oeOPxJdf/ysnEfkU2AnWqcvGKDPuNmrfIXF3r7nWh6xvDblTuF+hLcE0P5dnXRk0Q
 2kdwroGUF9c8gUZwylq3Ek2oovrBOwMgF4AOZKWfC6eDKbSv3+eoUV7W2tXKCBFB7oEK
 PJv32uxI3s15jKfgIcQF/q3FNoRdNvVuF5TpecLJIhh2Utm7QeutWl2yMZEUwJXGkgsr
 Mxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717509053; x=1718113853;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CmU0DTF3wr3QsPtiX/X8uKixsYvsbrBSlvb1F0M3SQ=;
 b=Utt6bLNDlhDPpUhzazmCL5vdi1v8rw2URYhKvSzpfZ3pX2rcjQg94wk4wxTo/shIi0
 b547n6geboYKcYq8ZtpGw23Sb93eoZjAWElqBfbL6GJUhAMTfjAgEUrWFivfhEfTEZlo
 rKfpHIOovsDUO2b7Amh+mOWCOqkswTKGEMPn+YquXYb1aJUd8CHdWuEW7B+5dll3Zmpn
 tbzpTUky+tR802z+7u0dkOc9v8h0et/oZsOEKG5j4xz1hUifArDlbnLp+JENe+jHBHSm
 xL4zhYP7acpEMW9xv3Ovd3QT5QgUeX++3q6ZdXh+wyRhv26Vnf370uIrKXzAl3aBv1N5
 Uuew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWeSYJEDQ+j7a62VWYSZJZ6vGKIU5DIfJaSFCaLN5wF7OPjV12cy3gEDKeg8CT9KfrKGqHpek/RWVwA0Vz1isajW6ex4fI5QznWCTsPJgD
X-Gm-Message-State: AOJu0YxejYTvL2bpFXMPjL4jDlly87gwWhkzk+4icvi46z2+22fIGYYm
 gwpkurHtE78XRS77QhEv40aDVi1axRFq6H6FhfWjp7p7zl7UjDF1ydf3Xp4Oq04=
X-Google-Smtp-Source: AGHT+IEKzaDjXASfbYTGTMDqSF3S8HOCUTwRYdvhMGZS2at1GRzbC8wUQ7EhWXjf0frP4FQPZnZyBQ==
X-Received: by 2002:a05:600c:524f:b0:421:494c:9e74 with SMTP id
 5b1f17b1804b1-421494ca032mr20179575e9.23.1717509053151; 
 Tue, 04 Jun 2024 06:50:53 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42133227f8asm139569755e9.19.2024.06.04.06.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 06:50:52 -0700 (PDT)
Message-ID: <84a86082-f28d-4750-a4ab-1c534bc54b78@freebox.fr>
Date: Tue, 4 Jun 2024 15:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/4] arm64: dts: qcom: msm8998: add HDMI GPIOs
From: Marc Gonzalez <mgonzalez@freebox.fr>
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
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Language: en-US
In-Reply-To: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

MSM8998 GPIO pin controller reference design defines:

- CEC: pin 31
- DDC: pin 32,33
- HPD: pin 34

Downstream vendor code for reference:

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi#L2324-2400

mdss_hdmi_{cec,ddc,hpd}_{active,suspend}

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index e5f051f5a92de..ba5e873f0f35f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1434,6 +1434,34 @@ blsp2_spi6_default: blsp2-spi6-default-state {
 				drive-strength = <6>;
 				bias-disable;
 			};
+
+			hdmi_cec_default: hdmi-cec-default-state {
+				pins = "gpio31";
+				function = "hdmi_cec";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_ddc_default: hdmi-ddc-default-state {
+				pins = "gpio32", "gpio33";
+				function = "hdmi_ddc";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_hpd_default: hdmi-hpd-default-state {
+				pins = "gpio34";
+				function = "hdmi_hot";
+				drive-strength = <16>;
+				bias-pull-down;
+			};
+
+			hdmi_hpd_sleep: hdmi-hpd-sleep-state {
+				pins = "gpio34";
+				function = "hdmi_hot";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
 		};
 
 		remoteproc_mss: remoteproc@4080000 {
-- 
2.34.1

