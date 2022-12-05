Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC80643612
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 21:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E3D10E29C;
	Mon,  5 Dec 2022 20:52:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89EE510E29F
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 20:52:17 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id p36so16142099lfa.12
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 12:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vqBCULZsH1OdaokS8FbAX84aFqUsQnlUhPdzG7kPjaQ=;
 b=b/gNb7v5ouWnLQNd18FzsJWvshGa9Ys+2oX/N7t3fdcf1vjQCdxfiUeUCmeIDuivem
 6/ZuvGLZ0qvVxZP+Bp5oF3lHYZMDdd8NNnknpdZihIkh0DD8UG8V2dab7l3jLgsTo1gU
 PzJQ8VSveolTDGrG4qjNgmWVSttRsC0enQeB5csK3DdR4P5Wb4wXEEs3M9H3sb4IyD0D
 WTLAO50LqaY35B+LbfB8B6MnzGY38XSrTveuYszpquFVlMOHyGdrdnpbiIVkfDx5D3ht
 J1HuvuGPM8rSphvyFaW8D53TUbA9fcrugG4sR8K/eVcyKD6qBd9bEG0sOJXceoubw3Pe
 F8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vqBCULZsH1OdaokS8FbAX84aFqUsQnlUhPdzG7kPjaQ=;
 b=Lq6Gl81/0krE72JRjfC11JiQDeAOMt5LdTsNsc5z4zsRPHXHC2DAHhFe0CsAoAIpMg
 ZmrFPAS1hHNb4G3nOgG02gnoddSn96yhs2LAyYzXR7HTK29IbAyN5LPNg8vKNVzehVC4
 LHSYDXEK0qV+sRl01Z2ryZ968u7g9o9ca/xyPj+OE5vr3DfxSILWp9hpcY353U6bbjvk
 anwwHlodSczgn5F5wiVA/Idj7YxrsB7aNxyLSPDjWhSUYnh4lGfp2qU7QLibHLFQz/cC
 SXnzhq6RkIZPzPHK6A+n2YF2Le6MR2MsQuLzbYBCpvHrOZrtYOiUm+CYiMIZwWKfm7Oe
 07Vw==
X-Gm-Message-State: ANoB5pnvTQB4m13Yjfg3aWAokHDyKGBAo3z5vONLyAa50NBqkIij68AN
 ozcDM+6lj6fRnLIBcwxOa68cQA==
X-Google-Smtp-Source: AA0mqf6l1OJoaWZd7yCu3zcRqXMekbpIIUVEADTiLCwbsEbC8iDuyXbb1SYSGfvhvl5TTweL0EpH0g==
X-Received: by 2002:a05:6512:b98:b0:4b5:5f2d:1458 with SMTP id
 b24-20020a0565120b9800b004b55f2d1458mr3408679lfv.253.1670273535824; 
 Mon, 05 Dec 2022 12:52:15 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.129]) by smtp.gmail.com with ESMTPSA id
 g6-20020a0565123b8600b004b5812207dbsm153841lfv.201.2022.12.05.12.52.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Dec 2022 12:52:15 -0800 (PST)
Date: Mon, 05 Dec 2022 23:51:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org, airlied@gmail.com
User-Agent: K-9 Mail for Android
In-Reply-To: <1670267670-15832-5-git-send-email-quic_khsieh@quicinc.com>
References: <1670267670-15832-1-git-send-email-quic_khsieh@quicinc.com>
 <1670267670-15832-5-git-send-email-quic_khsieh@quicinc.com>
Message-ID: <E8BDDF33-972D-4CC2-9D22-DFE23A7C38E6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v8 4/5] drm/msm/dp: parser link-frequencies
 as property of dp_out endpoint
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



On 5 December 2022 22:14:29 GMT+03:00, Kuogee Hsieh <quic_khsieh@quicinc=
=2Ecom> wrote:
>Add capability to parser and retrieve max DP link supported rate from
>link-frequencies property of dp_out endpoint=2E
>
>Changes in v6:
>-- second patch after split parser patch into two patches
>
>Changes in v7:
>-- without checking cnt against DP_MAX_NUM_DP_LANES to retrieve link rate
>
>Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc=2Ecom>
>---
> drivers/gpu/drm/msm/dp/dp_parser=2Ec | 19 +++++++++++++++++--
> drivers/gpu/drm/msm/dp/dp_parser=2Eh |  2 ++
> 2 files changed, 19 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/dp/dp_parser=2Ec b/drivers/gpu/drm/msm/d=
p/dp_parser=2Ec
>index b5f7e70=2E=2E037dad8 100644
>--- a/drivers/gpu/drm/msm/dp/dp_parser=2Ec
>+++ b/drivers/gpu/drm/msm/dp/dp_parser=2Ec
>@@ -94,15 +94,28 @@ static int dp_parser_ctrl_res(struct dp_parser *parse=
r)
> static int dp_parser_misc(struct dp_parser *parser)
> {
> 	struct device_node *of_node =3D parser->pdev->dev=2Eof_node;
>+	struct device_node *endpoint;
>+	u64 frequency;
> 	int cnt;
>=20
> 	/*
> 	 * data-lanes is the property of dp_out endpoint
> 	 */
> 	cnt =3D drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_=
LANES);
>-	if (cnt > 0)
>+	if (cnt > 0) {
> 		parser->max_dp_lanes =3D cnt;
>-	else {
>+
>+		endpoint =3D of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 *=
/
>+		cnt =3D of_property_count_u64_elems(endpoint, "link-frequencies");

Missing of_node_put()

>+		if (cnt > 0) {
>+			of_property_read_u64_index(endpoint, "link-frequencies",
>+							cnt - 1, &frequency);
>+			frequency /=3D 10;	/* from symbol rate to link rate */
>+			parser->max_dp_link_rate =3D (frequency / 1000); /* kbits */
>+		} else {
>+			parser->max_dp_link_rate =3D DP_LINK_RATE_HBR2; /* 540000 khz */
>+		}
>+	} else {
> 		/*
> 		 * legacy code, data-lanes is the property of mdss_dp node
> 		 */
>@@ -111,6 +124,8 @@ static int dp_parser_misc(struct dp_parser *parser)
> 			parser->max_dp_lanes =3D cnt;
> 		else
> 			parser->max_dp_lanes =3D DP_MAX_NUM_DP_LANES; /* 4 lanes */
>+
>+		parser->max_dp_link_rate =3D DP_LINK_RATE_HBR2; /* 540000 khz */

Please, don't mix the dp lanes and dp link rate code=2E It would be much e=
asier to read=2E And you can remove the duplicate assignment statements too=
=2E

> 	}
>=20
> 	return 0;
>diff --git a/drivers/gpu/drm/msm/dp/dp_parser=2Eh b/drivers/gpu/drm/msm/d=
p/dp_parser=2Eh
>index 866c1a8=2E=2E3ddf639 100644
>--- a/drivers/gpu/drm/msm/dp/dp_parser=2Eh
>+++ b/drivers/gpu/drm/msm/dp/dp_parser=2Eh
>@@ -15,6 +15,7 @@
> #define DP_LABEL "MDSS DP DISPLAY"
> #define DP_MAX_PIXEL_CLK_KHZ	675000
> #define DP_MAX_NUM_DP_LANES	4
>+#define DP_LINK_RATE_HBR2       540000
>=20
> enum dp_pm_type {
> 	DP_CORE_PM,
>@@ -119,6 +120,7 @@ struct dp_parser {
> 	struct dp_io io;
> 	struct dp_display_data disp_data;
> 	u32 max_dp_lanes;
>+	u32 max_dp_link_rate;
> 	struct drm_bridge *next_bridge;
>=20
> 	int (*parse)(struct dp_parser *parser);

--=20
With best wishes
Dmitry
