Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27C55BBB2
	for <lists+freedreno@lfdr.de>; Mon, 27 Jun 2022 21:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5549A11B02C;
	Mon, 27 Jun 2022 19:19:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE1A11B02C
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 19:19:43 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-101ec2d6087so14186116fac.3
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Z4BLBohMulDpiQGQwkIAJHPx8Gj0+neiaxc8ZfUwbzs=;
 b=FhXMKjKCFkRUVtJCSpdI3CkMufY98kLhUCjtQ6qz3yaP1HUGK46079/aOcGvtf4Vu6
 s+pQpMUiYXG3dEKsuLAYzthsqRht99ySLWEHdqzPnD0iTujCoBzl/SnTPfo7/qLYLSk5
 xZMyfJQ/H7aeX1nrYRJtFpD46dqGo9Z/K8TJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Z4BLBohMulDpiQGQwkIAJHPx8Gj0+neiaxc8ZfUwbzs=;
 b=6GiFqFQdzgStsP6tVwbSBU7rC5CQ5DMYZcpkGXNjA+Abidpv/nQ1YTbRY/diVjIdWC
 J6/wu4uE9yBPHYHsR/i6OrShNmROxK/Ar2VsA/YLZoOFwH4dYFRYi8WvdNeq435u2zOH
 KgpRDcNLAsaaAyKLGLg6MfCGaIipNITyCB6laGB4jgo6u+NkPfOsv6U8w4TUp1IcCC9A
 Zt9JdWAi04QVxB6gZ2QggkjwWK+Yx5Qw7eYlyhloKeKdvkzfYrfqZH1B79ZKUUxHHhUt
 jwh6bqC5+x7DO67DWBgKWqb3NuavSz04olDeugZ3wWEzmYlMsNkPYwdvDf7KnnPehEC+
 q9fw==
X-Gm-Message-State: AJIora8X1fiD+UdJv2+V7698/iFM5MioG9GpgTMyEEJODldyYUfRPyDM
 g/fHiwlf/5hO4o4v90mlVkLaCvOC8Itx8r1PbwHx0A==
X-Google-Smtp-Source: AGRyM1tD+1otcDiEgbeGj10XjPtM+eHLnUuS+FgxcbXZDbTbvpy7V+WXNg3lEBi9QRly6nt/PZ2uBEKT7eNNpzkWjjo=
X-Received: by 2002:a05:6870:b627:b0:102:f25:a460 with SMTP id
 cm39-20020a056870b62700b001020f25a460mr8608960oab.193.1656357582537; Mon, 27
 Jun 2022 12:19:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Jun 2022 12:19:41 -0700
MIME-Version: 1.0
In-Reply-To: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
References: <20220627165413.657142-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 27 Jun 2022 12:19:41 -0700
Message-ID: <CAE-0n52OA=qSOmez983_J0PCa4D5qte-1VWMZcAMqjpMytGgEQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: use ARRAY_SIZE for calculating
 num_descs
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-27 09:54:13)
> If for some reason the msm_dp_config::descs array starts from non-zero
> index or contains the hole, setting the msm_dp_config::num_descs might
> be not that obvious and error-prone. Use ARRAY_SIZE to set this field
> rather than encoding the value manually.
>
> Reported-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
