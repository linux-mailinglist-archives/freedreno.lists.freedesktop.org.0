Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5703664C0AD
	for <lists+freedreno@lfdr.de>; Wed, 14 Dec 2022 00:32:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D689A10E377;
	Tue, 13 Dec 2022 23:32:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEE310E1ED
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 23:32:29 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id c1so7631328lfi.7
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 15:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0mSBEF/cK9qO+wKe5gbeL/o/RiTSxMYAo8a4NjEeZbE=;
 b=Ar7QLMoSvVNZoWRu44T7jq7Fw7D3rHhc0N5qmhf3IN610AGTp3jq4KMDFJxcVwCoqT
 K1lpZD3IjowOpMJwRuKBHOLEssZl5ohZxii8IV8Y7Yflpr16+0ge7YKfqg91EJKcHvKU
 8Ml69fHqtlP2cBYJ/gjY796OwzwL7T8r4llIpBqiZ4P3SMcjFP6VhFcwERL7TldckK7e
 +DxIvjWDbY3TOdDNBonGAY1LZguxb/jdboCB7wGJnRIOU9X81aOn/ofkKDmjwq4l2twQ
 VOKa0lpmDL1DNBQoK2ycvQ0tNS+pShHPf2KKnudflOhS9bsowiy6HBL4dRkka2cjNIvz
 zAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0mSBEF/cK9qO+wKe5gbeL/o/RiTSxMYAo8a4NjEeZbE=;
 b=5sVjCZXhdrXTfiWv4v3Det2Wj6B0aQvQaIzLoN/PBbiW89xOHcWwf8rXcwFgChYUWW
 poiIy9yBEU8qkDjvGKELnLPDUTgnZ19fReNoNx7RtXWx9XNvDDug0kn+zTzP47ylOJQF
 1lQFa0rsJPHUbH2K0Oq/+wGwgoKDYQjm3qYm34dQR94v/pXGcMe5doICoLlC8A9ynYrj
 HL5Dv2L1q65nx9eX6O0s4NNL3xhtqGJZlxpo++drwf40fNp1lnn0ChGyFB9h6uxknan8
 J6YSbWORTGw0D4lqwDaYFwoeI1xWs90I1JHikX6flf1Zt9i+X12eddqbwu1z/lPNvEDz
 b3fg==
X-Gm-Message-State: ANoB5pmkmv/T2xJh4GkGHRvmc+LnQW6Ll02NkW1ZM3ZS4WfjaREm7GjN
 Aq1Iqy2Z7rpI3zAOEmpzb/mgDg==
X-Google-Smtp-Source: AA0mqf70+WjC0RCpIae/lDzkigCOMrvR2zfYcJpnyv3W7RRP7VAILtGVl0v5T1LuqZMt3RisIkWfpg==
X-Received: by 2002:a05:6512:ad6:b0:4b5:b7a7:ebfa with SMTP id
 n22-20020a0565120ad600b004b5b7a7ebfamr5344476lfu.64.1670974347455; 
 Tue, 13 Dec 2022 15:32:27 -0800 (PST)
Received: from ?IPv6:::1? (dzccz6yfpdgdc5vwjcs5y-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00:8c19:462c:c647:13f2])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a056512315700b004b5812207dbsm550670lfi.201.2022.12.13.15.32.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Dec 2022 15:32:27 -0800 (PST)
Date: Wed, 14 Dec 2022 01:31:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
User-Agent: K-9 Mail for Android
In-Reply-To: <1670967848-31475-2-git-send-email-quic_khsieh@quicinc.com>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-2-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <2086A443-8311-49BA-B700-9951076F7623@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v12 1/5] arm64: dts: qcom: add data-lanes
 and link-freuencies into dp_out endpoint
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 13 December 2022 23:44:04 EET, Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>=
 wrote:
>Move data-lanes property from mdss_dp node to dp_out endpoint=2E Also
>add link-frequencies property into dp_out endpoint as well=2E The last
>frequency specified at link-frequencies will be the max link rate
>supported by DP=2E
>
>Changes in v5:
>-- revert changes at sc7180=2Edtsi and sc7280=2Edtsi
>-- add &dp_out to sc7180-trogdor=2Edtsi and sc7280-herobrine=2Edtsi
>
>Changes in v6:
>-- add data-lanes and link-frequencies to yaml
>
>Changes in v7:
>-- change 160000000 to 1620000000
>-- separate yaml to different patch
>
>Changes in v8:
>-- correct Bjorn mail address to kernel=2Eorg
>
>Changes in v9:
>-- use symbol rate (hz) for link-frequencies at dp_out at sc7180_trogdor=
=2Edtsi
>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>---
> arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi   | 6 +++++-
> arch/arm64/boot/dts/qcom/sc7280-herobrine=2Edtsi | 6 +++++-
> 2 files changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi b/arch/arm64/=
boot/dts/qcom/sc7180-trogdor=2Edtsi
>index eae22e6=2E=2E93b0cde 100644
>--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi
>+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi
>@@ -814,7 +814,11 @@ hp_i2c: &i2c9 {
> 	status =3D "okay";
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&dp_hot_plug_det>;
>-	data-lanes =3D <0 1>;
>+};
>+
>+&dp_out {
>+    data-lanes =3D <0  1>;

Quoting Krzysztof from v12:


Why adding two spaces? Just cut previous line and paste it, don't change i=
t=2E

>+    link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000>;
> };
>=20
> &pm6150_adc {
>diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine=2Edtsi b/arch/arm6=
4/boot/dts/qcom/sc7280-herobrine=2Edtsi
>index c11e371=2E=2E3c7a9d8 100644
>--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine=2Edtsi
>+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine=2Edtsi
>@@ -442,7 +442,11 @@ ap_i2c_tpm: &i2c14 {
> 	status =3D "okay";
> 	pinctrl-names =3D "default";
> 	pinctrl-0 =3D <&dp_hot_plug_det>;
>-	data-lanes =3D <0 1>;
>+};
>+
>+&dp_out {
>+	data-lanes =3D <0  1>;
>+	link-frequencies =3D /bits/ 64 <1620000000 2700000000 5400000000 810000=
0000>;
> };
>=20
> &mdss_mdp {

--=20
With best wishes
Dmitry
