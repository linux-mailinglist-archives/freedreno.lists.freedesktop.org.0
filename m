Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D963D276
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 10:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FCD810E23B;
	Wed, 30 Nov 2022 09:51:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58A910E191
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 09:50:59 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-3bfd998fa53so112612597b3.5
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 01:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=85CBpe8h6suPlC2YlUqV3pCbiuyIDeu7NL7tAzWSq04=;
 b=WMQHbII59gMQ0BlEfRQu/mx7qNJjrPJO7OqapZERyzpNTOsYZeo79HPXvNUQb2WH/g
 IsVteDPqxVox+ZFHzsroABU1M9JcDSi9MSNK0CmQpoLfJlERObQjoZlYfyCXinMQBfK4
 Iys+Lm0Fp4z5uqFibE++OQPIYgruCqrIIfoonVqw+S5Jwr13dyHJjwXmZykNsxMwUB4E
 S7h1Xhfo8AlwrrLbn876IzrNOITSfHH20iPy6R1kSMirhzHRdOMuNVF+/tUBGGY6JFIn
 Gbn2SoJ+Gkhud76kOUhRyP3c7q6ZuM9HJ1V2QQUn67MAqC5gVATxLXOacvAs2Gd/oKeg
 4ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=85CBpe8h6suPlC2YlUqV3pCbiuyIDeu7NL7tAzWSq04=;
 b=lJAN+F+C9A/MpLGmZpC+rltNfWznLK7PiyPUuoN6bYXu9HU5c1qvOtPmq9G0z4bdOH
 dgUmKeKSWrDdZi5gBh6YO70BC3XDj+5DEjZhMg3ugtLiXl7PXzcVwNExGlEprxpWr9uW
 LF9LhzAZ+mPVa8cWDtBEN3Bu5XsN4N1cVxE7UMeTDx4c2jzPxht/p5tmPQG55CKqU96Q
 NGrx017xrt6b+u4xydvopEDlIV2Y5cZeU71BwIlBsifVTQYjEumLQNvdpwvzHh8tcCQU
 8nCYoQEHobXaLisJUGE01L1rYkFxrf6WDm2IvAFe5/4OQ+eDY8b4Y5rBqrmMmnlprowq
 diXQ==
X-Gm-Message-State: ANoB5pkgwqXSLPqin0p7tZjgr9rNSCbJ21DSIsdWD1zUEaMh7Wn4I4wA
 YzRS25XAMNM3Rha/vu/FXHYsZlTgzwKduf4x2oag2w==
X-Google-Smtp-Source: AA0mqf5nA1N+rUMCNTWTlTmneC+iJIjUIdYRscTuKjxKx6GwENB0YR1xBSvYfk36+SLH/PPzg8wy1CB+3xgKhh7YJcA=
X-Received: by 2002:a0d:db15:0:b0:3d6:2151:4038 with SMTP id
 d21-20020a0ddb15000000b003d621514038mr1132331ywe.418.1669801858887; Wed, 30
 Nov 2022 01:50:58 -0800 (PST)
MIME-Version: 1.0
References: <1669767131-13854-1-git-send-email-quic_khsieh@quicinc.com>
 <1669767131-13854-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1669767131-13854-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Nov 2022 11:50:48 +0200
Message-ID: <CAA8EJppEHrPeoCxZUerf4MjDVkYEm7EvTcsm8eTAQBUVMqc_cA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 2/3] drm/msm/dp: parser data-lanes and
 link-frequencies from endpoint node
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Both data-lanes and link-frequencies are property of endpoint. This
> patch parser endpoint to retrieve max data lanes and max link rate
> supported specified at dp_out endpoint. In the case where no endpoint
> specified, then 4 data lanes with HBR2 link rate (5.4G) will be the
> default link configuration.

So, you have two changes in a single patch.
1) Moving the data-lanes to the endpoint
2) Adding link-frequencies.

Please split the patch accordingly. Also keep in mind that you have to
provide backwards compatibility for the data-lanes property.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 34 ++++++++++++++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_parser.h |  2 ++
>  2 files changed, 28 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index dd73221..9367f8c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -94,16 +94,34 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>  static int dp_parser_misc(struct dp_parser *parser)
>  {
>         struct device_node *of_node = parser->pdev->dev.of_node;
> -       int len;
> -
> -       len = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> -       if (len < 0) {
> -               DRM_WARN("Invalid property \"data-lanes\", default max DP lanes = %d\n",
> -                        DP_MAX_NUM_DP_LANES);
> -               len = DP_MAX_NUM_DP_LANES;
> +       struct device_node *endpoint;
> +       int cnt;
> +       u64 frequence[4];

frequency

> +
> +       endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> +       if (endpoint) {
> +               cnt = of_property_count_u32_elems(endpoint, "data-lanes");
> +               if (cnt < 0)
> +                       parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +               else
> +                       parser->max_dp_lanes = cnt;
> +
> +               cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
> +               if (cnt < 0) {
> +                       parser->max_dp_link_rate = DP_LINK_FREQUENCY_HBR2; /* 54000 khz */

Wrong number of zeroes

> +               } else {
> +                       if (cnt > 4)    /* 4 frequency at most */
> +                               cnt = 4;

'4 frequencies'. Not to mention that magic '4' should be defined
somewhere. Or removed completely. See below.

> +                       of_property_read_u64_array(endpoint, "link-frequencies", frequence, cnt);

Can you please use of_property_read_u64_index() instead? It also has a
nice feature of modifying the out_value only if the proper data was
found. So you can set the default and then override it with the
of_property_read function. And then divide it by 1000 to get the value
in KHz.

> +                       parser->max_dp_link_rate = (u32)frequence[cnt  -1];
> +                       parser->max_dp_link_rate /= 1000;       /* khz */

The HDR3 rate is 8100 Mb/s. 8 100 000 000. This doesn't fit into u32
(U32_MAX = 4 294 967 295).

> +               }
> +       } else {
> +               /* default */
> +               parser->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> +               parser->max_dp_link_rate = DP_LINK_FREQUENCY_HBR2; /* 54000 khz */

Wrong number of zeroes. Better use Mb/s or Gb/s directly. Also it is a
rate, not a frequency, so the define should also use 'RATE' in its
name.

>         }
>
> -       parser->max_dp_lanes = len;
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
> index 866c1a8..76ddb751 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.h
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.h
> @@ -15,6 +15,7 @@
>  #define DP_LABEL "MDSS DP DISPLAY"
>  #define DP_MAX_PIXEL_CLK_KHZ   675000
>  #define DP_MAX_NUM_DP_LANES    4
> +#define DP_LINK_FREQUENCY_HBR2 540000
>
>  enum dp_pm_type {
>         DP_CORE_PM,
> @@ -119,6 +120,7 @@ struct dp_parser {
>         struct dp_io io;
>         struct dp_display_data disp_data;
>         u32 max_dp_lanes;
> +       u32 max_dp_link_rate;
>         struct drm_bridge *next_bridge;
>
>         int (*parse)(struct dp_parser *parser);
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


--
With best wishes

Dmitry
