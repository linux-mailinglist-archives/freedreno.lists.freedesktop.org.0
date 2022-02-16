Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F504B7CF5
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 02:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226CB10E5EA;
	Wed, 16 Feb 2022 01:57:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C2810E5EA
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 01:57:22 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 v17-20020a4ac911000000b002eac41bb3f4so829438ooq.10
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 17:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=yf7K0uG0GDfWyq/No5Sw4cB3nhUdbA5wJESpoT/OmDo=;
 b=XG3bMqg+15oGPBOvIW+H08FKDWnUCCndmCg/ckMoT3QhbZK4foOtLBnqnRGbtAak0h
 uLwV2vVu9waUtgPXuo2Xp0ur4QFbhaMu5uGo9nlT55ySvaX0iix70v5J7E4Ot6/aO6qI
 D8MwGf2+55KDBOy0k8fc3GZGSy9Y6NGS6BFao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=yf7K0uG0GDfWyq/No5Sw4cB3nhUdbA5wJESpoT/OmDo=;
 b=JoEIPse+bjA52TdQQOhqZvLj17unIwNU7NCtvEdnGT8P/8h7yYzvhRN8bM2j3i2tn3
 NGB8uJvNi5/7ezVqYEz8hwMws8Qwi0xlvSFqvVNKDWBB5tXI1V1foNtQ4vC02Pe8pi81
 +tDF/IqTqeNWmcve+pwpd0iHKUZBVGew4iqDJEDWha4P5JDjD1EgKo9yjkNPBFdy5Qoh
 dwURDfQQa2phSNY/Q5ZN8FSDOYn7wUsHk0Hy8oIKCccRo8fn8v+Tg1RxrWPFtvTAjR2k
 K7LXkEAFJ4NTnQu2dNcZvBYM3e+PROXh8pbThy8ZhYXbIgoRiM70QgMrGEjtV5kfwOIs
 BIHQ==
X-Gm-Message-State: AOAM533ff1tjQUjKZlxRy9Nu7xY4RIDZmJdoEBVajEniZDFWO8USWjH1
 E5Kiz2C3shfF4CjgA4aGTQvCbr6mqf+idigU2O7N0A==
X-Google-Smtp-Source: ABdhPJzxTL1aErorPNW6lKasnfASBJkXb0+zszIc2QCakyQmG7qkoIxuFZLAI+15rKnfF+/PiyZKCXL+k67kvlOM4o8=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr277746oap.54.1644976641436; Tue, 15 Feb
 2022 17:57:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:57:21 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:57:21 -0800
Message-ID: <CAE-0n53kJqudjzbHumrOMzXgK_2m8AdFohE645keYgD=HEyHOg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/8] drm/msm/dpu: remove msm_dp cached in
 dpu_encoder_virt
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:38)
> Stop caching msm_dp instance in dpu_encoder_virt since it's not used
> now.
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
