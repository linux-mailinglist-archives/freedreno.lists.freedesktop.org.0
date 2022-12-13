Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA1B64C063
	for <lists+freedreno@lfdr.de>; Wed, 14 Dec 2022 00:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2081110E1F0;
	Tue, 13 Dec 2022 23:18:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2372410E379
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 23:18:05 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y4so4981224ljc.9
 for <freedreno@lists.freedesktop.org>; Tue, 13 Dec 2022 15:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=3tQIDZYHqSXvl3rMBu3fM2B9opAFevnmmjQK+/CnUiw=;
 b=ZCM1ih2O5nIV21RaO126GpcWprmrejLKCAYG4TY4abv+FUJra9PGnA1DoK1+dEt1sc
 BOfoOD67t7zYd3rjIQMqEULG2FcP3ov2EgWa0J19qw4PDsvi4EoDLu4+E6ufZt2ggDve
 OE9lOb8DffIXzfohHA87G4ExcZviB1kiTniCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3tQIDZYHqSXvl3rMBu3fM2B9opAFevnmmjQK+/CnUiw=;
 b=5XLezZ3gpSD+AQCZMZEbN6t725BtcRVDE7r7YcX9f42KOZhl3/CYpObwaWkiOu90zR
 IQDyKDhoGeyIXOJEJmvRsTThOHmXxow6JoIShgUFvzEQqRpKEB1W5zfAo5zSQqVlKUm8
 ra5WTZs7TwDZq84S7p7s7hcxB18ETcNYhIWx207G5OaTCzEnFMj+Xm5JMGOm54ZYwbww
 RQ+KnqRlVcI9EBPfy/AyT8p75xZaymwI2YYlV7CVXlNZUcZwt2HSd0/tn0wW5NWQVlbH
 WbL8L2Azqdrfs92Y+7fOCHE5hI299SBMwxc6BdphRyCL7Lyjm5SwvzVt3bWIbp3paFAX
 CW3Q==
X-Gm-Message-State: ANoB5pmGr09ofVhi0KC7jehh5TLEWqzOf8YagL3cOw12F239duvfbkKJ
 F08T6FkKL78mJ6pVCfXkAZgDCyo+K6JgmQ/Naf5g3g==
X-Google-Smtp-Source: AA0mqf6qDCm9nv+NYUT3uVfSOnlQSIUHgFPIjejPDyIPaV7TOQ+N4R3Dqz6pILclJZQXgiTcNqhaFWq2Pta1k87delg=
X-Received: by 2002:a2e:bd88:0:b0:279:86e:7a09 with SMTP id
 o8-20020a2ebd88000000b00279086e7a09mr31358191ljq.277.1670973483417; Tue, 13
 Dec 2022 15:18:03 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Dec 2022 15:18:02 -0800
MIME-Version: 1.0
In-Reply-To: <1670967848-31475-5-git-send-email-quic_khsieh@quicinc.com>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-5-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 13 Dec 2022 15:18:02 -0800
Message-ID: <CAE-0n51G3sUbGftFr5RTsM2xwxCDW3y0N9KzAsZrSQX09_N0GA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, devicetree@vger.kernel.org, 
 dianders@chromium.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, konrad.dybcio@somainline.org, 
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v12 4/5] drm/msm/dp: parser link-frequencies
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

Quoting Kuogee Hsieh (2022-12-13 13:44:07)
> Add capability to parser and retrieve max DP link supported rate from

to parse

> link-frequencies property of dp_out endpoint.
>
> Changes in v6:
> -- second patch after split parser patch into two patches
>
> Changes in v7:
> -- without checking cnt against DP_MAX_NUM_DP_LANES to retrieve link rate
>
> Changes in v9:
> -- separate parser link-frequencies out of data-lanes
>
> Changes in v10:
> -- add dp_parser_link_frequencies()
>
> Changes in v11:
> -- return 0 if(!endpoint)
>
> Changes in v12:
> -- replace khz with kbytes at dp_parser.h
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Same parser in subject.

>  drivers/gpu/drm/msm/dp/dp_parser.c | 27 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h |  2 ++
>  2 files changed, 29 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index b5f7e70..5549495 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -91,6 +91,29 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>         return 0;
>  }
>
> +static u32 dp_parser_link_frequencies(struct device_node *of_node)
> +{
> +       struct device_node *endpoint;
> +       u64 frequency = 0;
> +       int cnt = 0;

'cnt' doesn't need to be initialized here.

> +
> +       endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> +       if (!endpoint)
> +               return 0;
> +
> +       cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
> +
> +       if (cnt > 0)
> +               of_property_read_u64_index(endpoint, "link-frequencies",
> +                                               cnt - 1, &frequency);
> +       of_node_put(endpoint);
> +
> +       frequency /= 10;        /* from symbol rate to link rate */
> +       frequency /= 1000;      /* kbytes */

Use do_div(frequency, 10 * 1000)? If you want comments it could maybe be
like this:

	do_div(frequency,
	       10 * /* from symbol rate to link rate */
	       1000); /* kbytes */

> +
> +       return frequency;
> +}
> +
