Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7BC485E6B
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 03:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D331A10E56F;
	Thu,  6 Jan 2022 02:07:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A7B10E56E
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jan 2022 02:07:12 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id v6so1651618oib.13
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 18:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=N8EyGGSmrvvI6zU1aQmKy8o54cZnNfEr69UiGzAV5Xg=;
 b=NxFVhNfzmEq5RCDmuy44ry2eINp5RIBA/UI9lnUXVtNeRh1g4inZSBQgJsaOiHkpuZ
 M8H0h59pBbxHadQ2QoWie5KzIFcXOp4pq8Fe+9w4RMK8jtEGvk+ZQ+f64XTDbv5wcr+Q
 op3ubfY18FPsSkmWAWki/KrbF3BFhxuvFOAu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=N8EyGGSmrvvI6zU1aQmKy8o54cZnNfEr69UiGzAV5Xg=;
 b=EKCDlX3htaDE9g6W/0LdIK72C6lI15XA2ydzT5gjY3LkW24x4OebSLjrCpCV0819/V
 XiFR4W1oj9YCXVfwOqE2qunqI5Q9FkL6fOplQP+GTFqMW9PtuImfeAXWSJddxa8qTB1H
 o/Bof1i0AC5ZMQ8Q3fAuJW01FxN/eZyUJzEGSMIqMUNks+96cPsOiA3+oiNrJ4Ea7iw8
 +no/26nuH2pe7p68vPlEqh/DWw2WedHtZ7fwD1cC6YCyH8l9ZZYWkvCpMnBMvGR/Wo+D
 0JAf86OzJUM6nVGbjMz6jO7bpL3z/CT5+T/0GKDpGhGEVS8iVScYFuB7p2UOMZEcpJYH
 ne1A==
X-Gm-Message-State: AOAM530aPijG3fIO17xKLgqwI2noY296G+DBk+zZYTA/8bwyiUdsrS/Q
 ED32yPcPO0MWMzBrchoRaak5cVV2xldNKDi0QLyvCQ==
X-Google-Smtp-Source: ABdhPJwMibIsFOJg1O7S6ixK9lYcwLkrgBiGvGU8C/v/R7joI0S4Kl3kddaxfXVhULAlQHivvDuZi7OlcYqOesAmHjQ=
X-Received: by 2002:aca:a953:: with SMTP id s80mr4711191oie.164.1641434831728; 
 Wed, 05 Jan 2022 18:07:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 18:07:11 -0800
MIME-Version: 1.0
In-Reply-To: <1640856276-14697-2-git-send-email-quic_rajeevny@quicinc.com>
References: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com>
 <1640856276-14697-2-git-send-email-quic_rajeevny@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 5 Jan 2022 18:07:11 -0800
Message-ID: <CAE-0n52xCvmFe4O9LfoHe7zSaWGH2dF2GGhROr60tb-DV=V8Sg@mail.gmail.com>
To: Rajeev Nandan <quic_rajeevny@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v1 1/2] dt-bindings: msm/dsi: Add 10nm dsi phy
 tuning properties
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
Cc: quic_kalyant@quicinc.com, robh@kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com,
 robdclark@gmail.com, robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 daniel@ffwll.ch, dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rajeev Nandan (2021-12-30 01:24:35)
> Add 10nm dsi phy tuning properties for phy drive strength and
> phy drive level adjustemnt.

s/adjustemnt/adjustment/

Please add the details about parasitics and eye shape tuning to this
commit text.

>
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> index 4399715..9406982 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -35,6 +35,18 @@ properties:
>        Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
>        connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
>
> +  phy-drive-strength-cfg:
> +    type: array
> +    description:
> +      Register values of DSIPHY_RESCODE_OFFSET_TOP and DSIPHY_RESCODE_OFFSET_BOT
> +      for all five lanes to adjust the phy drive strength.
> +
> +  phy-drive-level-cfg:
> +    type: array
> +    description:
> +      Register values of DSIPHY_RESCODE_OFFSET_TOP for all five lanes to adjust
> +      phy drive level/amplitude.

It would be better to put human understandable values into DT here. This
looks like a black box to anyone outside of qcom, so they won't know how
to tune or set these register values.

At least for phy-drive-level-cfg it sounds like it could be some sort of
property that is a u32 array of 5 elements for each lane indicating some
sort of amplitude, i.e.

	phy-max-amplitudes = <0 1 2 3 4>;
	phy-min-amplitudes = <0 1 2 3 4>;

where each index corresponds to a particular lane. Then the driver can
parse the amplitude and convert it into some sort of register value.
