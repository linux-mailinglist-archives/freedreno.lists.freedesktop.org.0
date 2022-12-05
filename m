Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0713164360D
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 21:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B180D10E29C;
	Mon,  5 Dec 2022 20:51:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8098E10E29C
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 20:51:16 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id s10so946749ljg.1
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 12:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Z2XpYiD/ntYKWMtGcoP22Vxvmru2pM1Nsi3jqANT0Rk=;
 b=cOSYWKjXUDbi5y3AIxWi01YF61DZ9ZNKMHn9yOgeHXmrxiv+s3K0CMfKoVSfUt3rjG
 0AKDtxond5QdIsglUBvFvFHjOjB80Bqhj86a+C74/tRnAF32bc4H0tVSW/C+G4XWtDyO
 PdooF6HHjlOX6eFwd4dLhkGgL3lDNIY6VhmmNhZDpP7mYuexMNzSnMmAtC4ebn/qjLK4
 WFqV5FcwvZMjuDJnj6Zw1HPacDdSDCCfB+/ALbU14rmAALSJfdjVBiZ4SVDfUKJd9jRm
 qG+f94wGkK/2KOc/SyqoEzG/2zt8ZSN/JgexZWos+WoO/YJjj3ss82+DHLsBMtbho7Sd
 0pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2XpYiD/ntYKWMtGcoP22Vxvmru2pM1Nsi3jqANT0Rk=;
 b=2BLwoHT1/YPIyhm4da+uLCxUE2k/sFVyedJy3YPfo7dfegn5ilteKpLvGLRojWVvsv
 hiR/G8cWLIm+Z5TJFVHhG2jv51WZm0NFlsp4ulVp0sE+sSugZ2sJ+TAvTY6Afh8pyVcb
 tagrXmNFu2KcNGLK89vEvfIRQzal6EzabSqmk8XOwA+7QMV0KYrh1B5NlSHSMeetcAMO
 jV+c+HEimhDKaLlvpNnl8e+KDsJFjU2Wk299aUdEdqo2DhT/cragIZMym4T2NovfkkoV
 Jp/Uel4qxJyK3tuz/rk8qTQoMWeIer9Co5pnW351TztCI+ZtP/yKyLSQjXYNbjm15Iwp
 FRrw==
X-Gm-Message-State: ANoB5pljkmnEAyct382uNSLWHi5JORA9vFQPjaKeKBKjqd6P1socB1Df
 vjbpmtvu+u8OjgRIWT1tn1+DOA==
X-Google-Smtp-Source: AA0mqf7SyCarcsRC8IOaK+qAfXMjpkGjzn1YGRp10LvTsSAbg66dy+LzP+D/fg9rb7Tk/wTKQLbJCQ==
X-Received: by 2002:a2e:a37c:0:b0:26e:93:980d with SMTP id
 i28-20020a2ea37c000000b0026e0093980dmr28205439ljn.488.1670273474926; 
 Mon, 05 Dec 2022 12:51:14 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 q8-20020a19f208000000b0048b0696d0b1sm2217877lfh.90.2022.12.05.12.51.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 12:51:14 -0800 (PST)
Date: Mon, 05 Dec 2022 23:49:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
User-Agent: K-9 Mail for Android
In-Reply-To: <1670267670-15832-2-git-send-email-quic_khsieh@quicinc.com>
References: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com>
 <1670267670-15832-2-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <0E711F23-A5C6-4AA1-A4EF-F6097ADA91AE@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v8 1/5] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
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



On 5 December 2022 22:14:26 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc=
=2Ecom> wrote:
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
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>---
> arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi   | 6 +++++-
> arch/arm64/boot/dts/qcom/sc7280-herobrine=2Edtsi | 6 +++++-
> 2 files changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor=2Edtsi b/arch/arm64/=
boot/dts/qcom/sc7180-trogdor=2Edtsi
>index eae22e6=2E=2E0ad50e2 100644
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
>+    link-frequencies =3D /bits/ 64 <162000000 270000000 540000000>;

This property still uses old values, it was not updated to Hz=2E

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
