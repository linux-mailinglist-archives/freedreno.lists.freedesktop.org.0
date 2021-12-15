Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFFA476176
	for <lists+freedreno@lfdr.de>; Wed, 15 Dec 2021 20:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD06B10F8E2;
	Wed, 15 Dec 2021 19:18:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00EE10F8E4
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 19:18:25 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id d2so21044909qki.12
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lupv2Y8caxWSPo/yUIpJfaEyopRdwsl8zpftq2TZo8c=;
 b=JeUquh9xs0mAhV646mX1fPpTfEWDBFm4VpV2DzQrI7hCt0URfzBNzPsqmp+Xcqga0n
 +MLIN75Prpx1MOT0sRYpZ1ckgt2UIU9Uly3dvMbUd+LgfWr+nu6ndecT3/1r9wmeg8p8
 sVaeU9BJcpoaRYpkyKjQcsfqQfakqh3Le8i/34X9IKrCmTEqU88aNYXxQcQAROakjvV0
 2pue5P3G7sATp3CiU51ut2qCjCvKB0u2H0um0qcQ26PDbW5o8hr55KWust5VfocLUuLJ
 x1sSIItAq9vS/jenmboVqsQ64XvKvwW4MvWXZxtLxKI7owqbjC6RuCuDWYNAMHinWcvI
 HPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lupv2Y8caxWSPo/yUIpJfaEyopRdwsl8zpftq2TZo8c=;
 b=lXpHx1TYgM02T8HJvy2O3/1oOKqVSsbLfB/e4Ab2W5xGOrwV61YzahigLZ7MSApLkR
 GtBsi4VMrv2yyz8S7XCfaZo/+2vsEsEyx9ANUMXyBzpwQ/DdYnrGXffxdVP8tY61f8Fj
 Jy6r4JZrvoLbFbFG1plPCV9dBbPP8M4JdFmqq4r+NttgXEgRwZEWTvKz0VlL9XQMhHBr
 YzsZnK4CUZ1W8iwOulNPjTGN2yhD2pYvK19kAeFh8aqdKTHX62i5/RrZQAH5QpwteeIr
 0AB0f3si/jf216hjVdWQ12hZrbHUBakhCoCSmfGIA127RyPc8Z1qzOwSxQpkdz3SpmSJ
 gcLg==
X-Gm-Message-State: AOAM531n7UrVeXGXwch/5yyJb70/EE6tzuxR45B+nEWd/0UYqwW/b3Pn
 LOnJ4agM4ShQyYMMXQK8PmrHuryq8htJjXbyPttAZQ==
X-Google-Smtp-Source: ABdhPJzmCzYw51IcVPfPmlbc4eeB5qwnEMYGJDj12g7Z7Wts0i2C3Tw6O2uiNZd87jJ7F7AWfQ2H8EeM1UL3meIYKTU=
X-Received: by 2002:a05:620a:13ea:: with SMTP id
 h10mr9971617qkl.30.1639595904803; 
 Wed, 15 Dec 2021 11:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20211215174524.1742389-1-robdclark@gmail.com>
 <20211215174524.1742389-3-robdclark@gmail.com>
In-Reply-To: <20211215174524.1742389-3-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Dec 2021 22:18:14 +0300
Message-ID: <CAA8EJpruB5kiynfJU93RzrmEiEZLYUyw+qEJoNgfcu4HK+7xFA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/3] drm/msm/disp: Export helper for
 capturing snapshot
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
Cc: Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Doug Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, Alexey Dobriyan <adobriyan@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 15 Dec 2021 at 20:49, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> We'll re-use this for debugfs.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 28 +++++++++++++++-----
>  drivers/gpu/drm/msm/disp/msm_disp_snapshot.h | 10 +++++++
>  2 files changed, 31 insertions(+), 7 deletions(-)
>


-- 
With best wishes
Dmitry
