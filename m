Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9BB6D0050
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 11:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C09810ED7E;
	Thu, 30 Mar 2023 09:56:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EC710ED7E
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 09:56:48 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-5445009c26bso344299827b3.8
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680170207;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RXazreuoSDNeY14GjG+L3kKUROFu/LX0XUCtalocMnM=;
 b=Q27wJUEvJTyPvijXy+9qg1b3N1bi8JzO7oBIfxk43L/4mnJwqi/DQ50YoHV2gP1SDn
 WEd8g0psLeqgsmxk4wmJ506yCMopC9oxoNHr/yJeTRSnOa5NSmEUYINlF4is9SmdOmAA
 7aWOLwf7v7Et1hre2bG6Fywp6w2Sh3mz+fIO1JeeZVfUN0IHkgES173p1Xa4Zs0aIyM/
 mI8+yq+TP5kEACBYVL6kJOPNI+2l6H0RhqP6WUfUhMuRS6u4cDI5a45NjYvDg7Z/RoiG
 HAtZUPLscJeS0jJeyZsHzX9SAsgYm2BsLYwnd2QCySEr1kUfoj86djdEfTSd/6hb6csa
 WCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680170207;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXazreuoSDNeY14GjG+L3kKUROFu/LX0XUCtalocMnM=;
 b=O+dAM2nUxm6UI47xDEGXlWkG/yfD1+Yv+T2g6L+9J4dDyVSSVqM3HivKYkEqbVd/2p
 ZycRCMbd04ZFcd2+bQpYx4rxe6oKgeAeka50Hsgv/APVWGvpj614lrpdSyw15P4CXYpa
 M+lF3k7hkmHNBK8aExOJTzw7deSNDrtND2BheB0oQQZEYjFcIr7vLSSXyHgV5G3/uDlb
 EzGqB1fsOJPDi499BhMfficwbUgyMzRuEEsM7dbOBHAwPrqsE5muOKosX6OyYZ6f7CY+
 cEvsu519WuU5vOxr0D3gDEtRON47LhNAh7iJyKJWu4kJfqmIKtul869INctTpE6Ix2xH
 iIew==
X-Gm-Message-State: AAQBX9c5cD0IoU85iIWPXXWafk2nBpujf/WQd+ftQsUAp5w0dPjvgcFc
 MPr9PhAPxElw/Xz2n4bxYt+BAIcjjEKa/zzfMtlDQQ==
X-Google-Smtp-Source: AKy350bqExKE8rYdpf9ZxL1xQIW0Uc8JA5RZ+3QA/9kw/Ho7amY2K61SplWlLgJTuBESzGdhksCO0/Iw2lTRgROvVEI=
X-Received: by 2002:a81:4520:0:b0:541:85d2:af21 with SMTP id
 s32-20020a814520000000b0054185d2af21mr11299150ywa.5.1680170207528; Thu, 30
 Mar 2023 02:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-3-tzimmermann@suse.de>
In-Reply-To: <20230330074150.7637-3-tzimmermann@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Mar 2023 12:56:36 +0300
Message-ID: <CAA8EJppyFcwyVqB715rtQLu1642fa3i7GhKobgGyjQKG5vsG6A@mail.gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 2/6] drm/msm: Remove fb from struct msm_fbdev
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, javierm@redhat.com, robdclark@gmail.com,
 daniel@ffwll.ch, linux-arm-msm@vger.kernel.org, airlied@gmail.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 30 Mar 2023 at 10:41, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Fbdev's struct fb_helper stores a pointer to the framebuffer. Remove
> struct msm_fbdev.fb, which contains thre same value. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 32 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
