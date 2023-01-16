Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6689E66BE35
	for <lists+freedreno@lfdr.de>; Mon, 16 Jan 2023 13:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220AE10E298;
	Mon, 16 Jan 2023 12:52:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDBE10E298
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 12:52:42 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id 203so30120780yby.10
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 04:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2HwxURQ04QRPHjYFiwUTAY9c1+Tu3uq4SQk4i0sNqu4=;
 b=BX2XXb6Z/I8uqSGq+V3t+G3jgfTOzjVgOOQsSxDjQGnulfnkLrpeXJgo7xxz7Lk3gb
 69GvlI+IeJRRULFIykgNvw14q5nFemOJXWUjCtnrpQGB8/270ANcD4Ra9GDwo5kdKXOH
 njJzNwh14rD6t/8n6V/YIE6klTzC4otbBHzBYR1PM9o7BKsWcaawdYlxMoWwaRVt7do/
 wP6GtqJt4YNQ6fGZvoxaNJNaMST/Xxs4MhUxU++Z2pu0A4iZCoVs5ZW0GFvP9x47vfPP
 pNE045klwXHyEJuo2GG7O+uB1ftlF2ixt0ES468NgvgLLGObBloQEGYaqUTWLy3utNVy
 VdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2HwxURQ04QRPHjYFiwUTAY9c1+Tu3uq4SQk4i0sNqu4=;
 b=Ai9YdK9dpFuwCPc7NWnG6lRE8DzTO10jU7gly9XEaiwVbPQBGgQ3GvJuNwutN/1XfT
 TH1HY37JnTayktL13pgXt8bdZeSB+rW44XrRbq8y+QTrLWFJw2tKItnJXGSMshx20sBl
 oBqJ+jm6Pc37XGA4CHD3nPtaJKBnLbhTfBG+U/VnOMGx2Ln+mfy5dAyCZPFwyJbaHVDo
 TiRFmYnlCHoedRQg4wE2pVqkpDJjDxtK6u9HaVcLTYyzkZzICbBNMuS++XYMe+4mseqs
 ZelAs/HmHVACROGSphj9dZ5q96/jF6uk6RIoXdIcs/541fj4r8FeEhRe/yl+wVbZ6IDO
 wW4A==
X-Gm-Message-State: AFqh2kpN8qW7E5buBjrSdWRAjDkBfsMawqRfQ/WVw3wMEvHSPz7IQFKc
 7zZxLA/8B6xJDaWeq0+WrnabgxvJo2l22USTfNFYig==
X-Google-Smtp-Source: AMrXdXvVqYBXE+hJ9b7YSEc2muX26rtwXJeHSCkz34eovdTPqEG7jDeQIgdO7eKutLnykzUqqBtiRDwJoRKQOLEeDNM=
X-Received: by 2002:a25:e648:0:b0:7c2:d9f1:3b04 with SMTP id
 d69-20020a25e648000000b007c2d9f13b04mr2486434ybh.516.1673873561962; Mon, 16
 Jan 2023 04:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20230116115132.348961-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230116115132.348961-1-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Jan 2023 14:52:30 +0200
Message-ID: <CAA8EJprNzLMnU7cguMit6Y4sgU0-SOkiiL+=s_BFBZiyvNvsAw@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] dt-bindings: msm/dsi: Don't require
 vdds-supply on 7nm PHY
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 agross@kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, marijn.suijten@somainline.org,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 16 Jan 2023 at 13:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
> which is voted for in the DSI ctrl node.

I think we should have an explicit `if compatible then required:
vdds-supply' clause. WDYT?

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index 9c9184f94c44..8e9031bbde73 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -48,7 +48,6 @@ required:
>    - compatible
>    - reg
>    - reg-names
> -  - vdds-supply
>
>  unevaluatedProperties: false
>
> --
> 2.39.0
>


-- 
With best wishes
Dmitry
