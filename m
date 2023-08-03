Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A3D76F44E
	for <lists+freedreno@lfdr.de>; Thu,  3 Aug 2023 22:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9614C10E239;
	Thu,  3 Aug 2023 20:53:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337F910E227
 for <freedreno@lists.freedesktop.org>; Thu,  3 Aug 2023 20:53:56 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-d0b597e7ac1so1649189276.1
 for <freedreno@lists.freedesktop.org>; Thu, 03 Aug 2023 13:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691096035; x=1691700835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1Mmv+/pXamB9oY0WEXeNBKPJsXGa3jNSNiztILLlTY4=;
 b=QG64sPxmlvnELJ1w3jUSh5YAd3vTo7EpCd65fa7G5iQBLlIkMAy+VRbHdR+BrW/wGt
 JljRATuIXnWdSvseD5g/VZ6+QGB0gMo4l2kBhhKjYnANbjiNRLgMSpI2e8svUet48pAN
 kVTz+8wD4JIKeHJQgNjv/4WfP6XFZfuNPvUMlQCQCC+5IEWmeCms9hBh43gw5dW/ASLo
 tWJElpEvC4pAQgv258VS5VlXUrGEaze3zVBFkd+zJ8hLGErHGyGG3qVW5QSR1xNXeRYK
 G62J6VtPPqy+/9UPrwdl6cGEgRw0iSWeBjyzH9LyhMfebZYHI+tt27+pYdOM8DaAgZdq
 yxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691096035; x=1691700835;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1Mmv+/pXamB9oY0WEXeNBKPJsXGa3jNSNiztILLlTY4=;
 b=SNjw6YpNtQNVvV+nCd1HaB4CxNT/KqruErdYXo2RdzDC3kAnQaB/CRnISKEXEospFG
 vxAKI+dtW8Cla32yh62D8W2q7d/6EM/imraa7yhjNyxHBYnTzaJQE+KCRXaCyswdFMun
 GsUqIn4aS5X6gQLRaDkPUQ3vI737IiIskbKSkx6+MG/ZPqeNAU3qcL/Sw/T1AJAFo+Ix
 250Uk7dQiEY5ZFAjXh3gv/5ufzAdGcyew20kdGuT8pQT2EfNSetmsHDg1weM09ZZI/EX
 bzcp/6Kub7Y3C3FxVMggzGtYKhD6uE5wM2s7fqpTnvBI2ztEQADHLsX2wppF+yHCv2ga
 xUtg==
X-Gm-Message-State: ABy/qLZjueNZm3Y0f6onD69C/qia4xZJQDubkqnbjTkJRcx7LGZo01zO
 ZSognQEiLWECEOevyl++DUds6UY0nzsldOGsZnMdVw==
X-Google-Smtp-Source: APBJJlF7XEIRCehOg8x18n+pAj6XjXh60FKRDpRItIlpCDy80h1FjXBqaG/sPhrf8edAz5AfQWjU0XJhdNgH+HQrRCI=
X-Received: by 2002:a25:694b:0:b0:d19:40c2:eb03 with SMTP id
 e72-20020a25694b000000b00d1940c2eb03mr20833186ybc.54.1691096035371; Thu, 03
 Aug 2023 13:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 3 Aug 2023 23:53:44 +0300
Message-ID: <CAA8EJppW6s4DgQDamAumYcSP7mqKD1zNrVAtKMabAK5bh3iPnA@mail.gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: Don't leak some plane state
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
Cc: linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 freedreno@lists.freedesktop.org, dorum@noisolation.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 3 Aug 2023 at 23:45, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Apparently no one noticed that mdp5 plane states leak like a sieve
> ever since we introduced plane_state->commit refcount a few years ago
> in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
> early by tracking commits, v3.")
>
> Fix it by using the right helpers.
>
> Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Reported-and-tested-by: dorum@noisolation.com
> Cc: dorum@noisolation.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
