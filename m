Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A47894F62A8
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 17:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BBE10E241;
	Wed,  6 Apr 2022 15:09:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8688010E241
 for <freedreno@lists.freedesktop.org>; Wed,  6 Apr 2022 15:09:46 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-de48295467so3224826fac.2
 for <freedreno@lists.freedesktop.org>; Wed, 06 Apr 2022 08:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=W+SggYf9ZzUodZE2aDeDsbfyv++1hsGS8AoCuhA4ZeY=;
 b=TABFHoDlD/pgPUkRr6Aj4RRrjDFDoyvY0P1V47KSIdKeldIqaeYv98NU2YIRxtdyXW
 ze/Dug8d8CJPMjX5RsVxT5gY81U0sQiwOb/E6NSCYeq1AIgO6w7SJ1zp+JUUeiPsKno/
 xxlsN2DRS4pK3QoqoH+UD9z91re79FgU/vmSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=W+SggYf9ZzUodZE2aDeDsbfyv++1hsGS8AoCuhA4ZeY=;
 b=EvVynOfWYWHjOo5IROy5osk0p+/4KqwM4SgKbPMvAoE0gdmE4jlIBn2yX8WMhT6Vub
 uA7a2eEHtMa+kWigCaXEatToPbNyikLy2z5QxxxxJBt1V+bbdqGedh4iyqUAqRSJyhNI
 v+VeBkv6e9SyYPeNjQ9rCcl8Tc5FiXQzIzdsMzD8ai7QMuT96oFegy6AG4aTE5Bq/42m
 n1w84WtVLUuWxhInoBPvJBEHyO6rl3hpHPuB2yyMN4XZAPSTmOCr0JuvYINWKK/k23sO
 XicIYWhOamtILrb0hU1/UcX31z6xyNB4BUIdTZueTNkbZ/U6zpMZ4z7Y79rFEWD1k61w
 YcoQ==
X-Gm-Message-State: AOAM53232dfJMxHVjENLQfq+/rqqU5j6F+eF9/ZVTueXxmxXMzdNSHjc
 k3sF/+JaTOxUut3MvqGpG+5GG+uw0PwuacqsIPk7yg==
X-Google-Smtp-Source: ABdhPJyiriWb9lM7r6nEGyokGF5E6v8arQe+jgv787NGJAGxQR/U6cRpfcBrI1g3T3RShG5DwchbWml9Jseu+Ya+YfA=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr4119396oao.63.1649257785731; Wed, 06
 Apr 2022 08:09:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Apr 2022 08:09:45 -0700
MIME-Version: 1.0
In-Reply-To: <20220406100556.479706-1-dmitry.baryshkov@linaro.org>
References: <20220406100556.479706-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Apr 2022 08:09:45 -0700
Message-ID: <CAE-0n52jMGWFFv3pRE2ZvY_+s1xGk09WXsqJsc1uR2buRZ0s3A@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm: remove unused plane_property
 field from msm_drm_private
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

Quoting Dmitry Baryshkov (2022-04-06 03:05:56)
> Remove unused field plane_property from struct msm_drm_private. Also
> drop the enum msm_mdp_plane_property which also becomes unused.
>
> Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
