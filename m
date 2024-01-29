Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43684095D
	for <lists+freedreno@lfdr.de>; Mon, 29 Jan 2024 16:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62A010FF8E;
	Mon, 29 Jan 2024 15:09:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9384610FF8E
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jan 2024 15:09:41 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso2210890276.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jan 2024 07:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706540921; x=1707145721; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WHc0ySmd3+BUchE2A6eeEhPhJOTzoceSWy6/UF2YYmg=;
 b=FbMy+QsU42aATf6ZjTrCY1tvRZ1q1ilKdSabwYra12/L263uGoeGnhjfS65mHrVeKX
 n+N4gI0TXpix4Y1iMGkUTbKPFyEb6BODrXUKLBQrnzaKHOYrcq7H8m0Y1F2q0aDFWGzc
 PUjXeG1jEqJhMomxBRjOFRkBi+q5C8tr/TlOfKnD9ltOownh741f5szLVEjkIsGk3vnc
 U4k9dejdVRben8Jb0doqbhwGXP9KEzJqYRsElT2q3vs02u/plvgBAKQ1w6REMpiXA4Od
 KtpJf/eQt5lYUVi/ITV2i++UEdw7xrgXhQnZa+sxLhOZHCZ7Ob3XbzqE5+ybfMzxxpuL
 k/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706540921; x=1707145721;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WHc0ySmd3+BUchE2A6eeEhPhJOTzoceSWy6/UF2YYmg=;
 b=H3vC2eW39sGx5e3gxvU9jzs8gwvB8B8TRON87nusR1326K1JDSpRcaZIHm9gUgQGSK
 fLdEMNFTUyncdz6QazZbVrPrELMHJPEuQmurH/LRuTneLW1rnxWVX4JwfyNs2w5KllnH
 dzsl9mnLm+oGOwgmDabRq1s1/mwTuzuHz4Ehlvah/iKiL5vcxJD5yn6HDgwuZP3CuDPx
 Edls0MD8zBNwxuB60R3zXmYaPUiDERa6mFGEChUOvp9+0v14t1LPpwkVcPNsJH6q7Ef9
 wLNU4BMuUnOcUcYTtmERoHn35qoG2ht979uuU0kT4GLm9ftgN2vXyWHS+JvDAINm1D0Q
 NMjQ==
X-Gm-Message-State: AOJu0YyhqvhYswY6KI2WlZDlyPqlLzNdGoNN/No/rhP/H1kRpI2prOwP
 TppItOXM/ZcRgYdwVzHM6VMbfF2DBTHhQXEZkDwWSRG1SLl3veCNKQc2wcMnNQydTkUemcVC5nI
 WSjhzRaJ+PJJr/iiPtWv0Xeu+akfNKoBd+DWQEg==
X-Google-Smtp-Source: AGHT+IEGAtVAdaZvHFjfmQf1IJOtCdXiDeGVR3eL7R75RzaD4DvPC28PHklGGBsD3t+yL5unf4AHNAwUb1afgQibw48=
X-Received: by 2002:a5b:18d:0:b0:dc2:23cf:6ada with SMTP id
 r13-20020a5b018d000000b00dc223cf6adamr2403587ybl.73.1706540920775; Mon, 29
 Jan 2024 07:08:40 -0800 (PST)
MIME-Version: 1.0
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-4-0d9eb8254df0@linaro.org>
In-Reply-To: <20240129-x1e80100-display-v1-4-0d9eb8254df0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 17:08:29 +0200
Message-ID: <CAA8EJpq1RSi4H6m6UQcyxEr=hip=ypKz9DhHziNKvDjUHsES8Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/msm/dp: Try looking for link-frequencies into the
 port@0's endpoint first
To: Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> On platforms where the endpoint used is on port@0, looking for port@1
> instead results in just ignoring the max link-frequencies altogether.
> Look at port@0 first, then, if not found, look for port@1.

NAK. Platforms do not "use port@0". It is for the connection between
DPU and DP, while the link-frequencies property is for the link
between DP controller and the actual display.

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 7032dcc8842b..eec5b8b83f4b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -97,7 +97,11 @@ static u32 dp_parser_link_frequencies(struct device_node *of_node)
>         u64 frequency = 0;
>         int cnt;
>
> -       endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> +       endpoint = of_graph_get_endpoint_by_regs(of_node, 0, 0); /* port@0 */
> +
> +       if (!endpoint)
> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> +
>         if (!endpoint)
>                 return 0;
>
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
