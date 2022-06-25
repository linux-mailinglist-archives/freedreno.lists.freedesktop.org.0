Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17655A56F
	for <lists+freedreno@lfdr.de>; Sat, 25 Jun 2022 02:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6118310E344;
	Sat, 25 Jun 2022 00:21:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3664910F5B6
 for <freedreno@lists.freedesktop.org>; Sat, 25 Jun 2022 00:21:27 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id q4so6877259qvq.8
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jun 2022 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WGrGp+UecLKKWdPmyonOqcgYxL0sqMxoEZLDjJ+Oefg=;
 b=x5FN+3eTosqOW/qHB/F6zX1XOc50YXWWP8BmXs6nv9KnUxfGxIsLKGwutP+WTkOPKv
 J6yBuqAFT2eYUcRt1Bomsia8NM7XwaIs9qJy+CpemtXmInCHnuOivfqE0u44O5uHdrpY
 Dpbr+D8MYFM6/XJtQ7lPyf4QxQrEUV/UTaDNxjH/2EV/1tn5U8let8ftptVhzgHzm2B0
 ZUj4wuQaLenwNO3+dDIWE80Wdu2fJRy6QpA4GmHnQHHZldDF2kF65Ok8rmcU6M+VpG82
 XCCXbOQJqMzFK3kdD6LeBa9LfIkU1e+NaZbFEJsgQY3QBO4mKDqb7AtHiEWt2IuaquPN
 Fq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WGrGp+UecLKKWdPmyonOqcgYxL0sqMxoEZLDjJ+Oefg=;
 b=eQcuZiLBQAzbFdaoZYd36y028H7KPxV3xkh2GwBXBgPXov3LUQxs51TsY3JpMVAZQ9
 Qf5OS2e1hSU+sDcEqsGLcZijMvXRJV6a1aJU+JfW2hhsyrpjC429OkeZdjep1AwLnNuH
 1PJn8hOWxmQp7UGIe6z1DujzNi4KIABmuMwy71scdKfUPgk0YBYib++Ff9jtiBc8z7UN
 r48XitYT5uGxHZ3NFMsopSwTg8n46q9tN8JZ4G6M2dRvpjxF162qZ0aaDwInzPRlZCNN
 leHCVZGQUV0km/yy/CVZWcLpGozqP3n1nKh3JCG9OJUF5SXGuCcfIDf34BW6A9FPb8yc
 9RmQ==
X-Gm-Message-State: AJIora/zMNUjWTmxhTKGEQbt609lN/QpZe3uwA7Fo+WD5GtAO33pmtZs
 6pNpPZn3FxOHoGvcP6MY4NlKB0/a0r2klrvZYhpSVQ==
X-Google-Smtp-Source: AGRyM1vLRVkO8hwg9Pz2Kx66cfUOsgnFZyC6GhDiNwy0itWwawuXgNNjMw68k8UNLgwOJaiaS88/ZcshKQ0pVth62Y4=
X-Received: by 2002:ac8:5983:0:b0:317:c3a3:be6b with SMTP id
 e3-20020ac85983000000b00317c3a3be6bmr1470756qte.370.1656116486303; Fri, 24
 Jun 2022 17:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <1656090912-18074-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52RW+UFJ=hqMWjwR8qvEbww7QjzPW1nhL3Atd97QXAnYw@mail.gmail.com>
 <007ea4c9-9701-f4ab-3278-5d36bf2018c4@quicinc.com>
 <CAE-0n53kNCK0ajHfY2WQr5HEQZtZSBLnhfbTuZwaUNEOZhsKPg@mail.gmail.com>
 <fa7f8bf1-33cd-5515-0143-6596df2bd740@quicinc.com>
 <CAE-0n51g-EVsC-i9=sJV-ySa8VnE+yT7cg=b-TNMi9+3uBiOVA@mail.gmail.com>
 <326912ff-9771-0711-366d-79acd436908b@quicinc.com>
 <CAE-0n51qrdrFtSr0vRwgYkMgSZfnzQuinaUROQsp30QoDchWQA@mail.gmail.com>
 <0ff3d6a3-dc5c-7c77-f8a1-6c4f6c1a3215@quicinc.com>
 <CAE-0n515hMKqQ+Vj1Sg54PpwkbWMYJ77QN+y+KZNBWymjhpWKw@mail.gmail.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
In-Reply-To: <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 25 Jun 2022 03:21:15 +0300
Message-ID: <CAA8EJpqEoXXA=eKGHRGuQ3VOHnmEShY8u_SMZ6WFWORCFhFcrw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of
 dp controller_id at scxxxx_dp_cfg table
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, dianders@chromium.org,
 airlied@linux.ie, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com, agross@kernel.org,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> How can I have eDP call dpu_encoder_init() before DP calls with
> _dpu_kms_initialize_displayport()?

Why do you want to do it? They are two different encoders.

-- 
With best wishes
Dmitry
