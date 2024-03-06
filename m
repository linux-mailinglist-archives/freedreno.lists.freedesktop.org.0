Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 844DB874090
	for <lists+freedreno@lfdr.de>; Wed,  6 Mar 2024 20:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA421134B9;
	Wed,  6 Mar 2024 19:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sF2aBxdp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A1F1134BE
 for <freedreno@lists.freedesktop.org>; Wed,  6 Mar 2024 19:37:25 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-609d9ce5bdeso830167b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 06 Mar 2024 11:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709753844; x=1710358644; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GNGb5BZ7AINJbJgQXn/Q7jDuTAr3ISUOPfFvM1cAIAU=;
 b=sF2aBxdpVbr5Jy0BPQ+cDrCm56jPQEJvrz3ZQRL1gd92pMs81DAXwkOVdyEDdNLc+P
 4QtVaEpUwSOntbejL4647fNf/L7nW2JE55cdj4GTp4Iv6DngtKrOVS+nhQ1KYMPbQ+Lp
 vXp3QPdGdJJlFyn9vI5CUlVAnMQaJ7R+6BAc2/yQFE5ZRUwIAJy/HiSJMKp3FjtM3XMX
 Hkvup160qMmz5epWIM6bdKD53R8Omu5+SxInE4zqaLcMGCpeMZJJj9Dx21pcn6wmb5Eg
 e9iDM9CopyQGAqa+YnmnAQNXXuALoY94/sB+804TlYwZAGnDrQjkA5hmK5L/SAVIMxR8
 /IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709753844; x=1710358644;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GNGb5BZ7AINJbJgQXn/Q7jDuTAr3ISUOPfFvM1cAIAU=;
 b=LGtzdWs4OSseSLZo/PzjEUbiKM7HpvhHDejlBm4Qm0JwteVH092RIzrEQerzeaKFA4
 iIkDpLcZPJzojUaciYTZmsVo6ZeGvbsj4QKrepasXN7yKh6D3Kn/wqROCJg4thwtX1VW
 jtXd4HW0GyM4zsbq5llvpGeQVidNBBFX6teMkxCGm8htjbAoVM7KzKltFq92KS4vnNtZ
 krNufpasPDeEryT1ngFIg/xX5sMF8hQrY+ynD+0mgNg4mVdNDDeXuMHmlsrMMIWD763C
 PKWuNyjwUQfPCJ1e5TaiUM1VykYV8jdqv4L8Dlmb1ginC7eEKiz+f10bz2EYhKf12OM0
 cplQ==
X-Gm-Message-State: AOJu0Yw+d2wuQ31e7LjShV+vQVyV7vBJex58P4GnNdRACudbHf82Y5/q
 R8uv81jxiGex5+DCUR9mXmGNQ84H6vmum+cIV65Y3q1LA6+Me3I+1ci4sI1Qshc6iUZhGmN5Ntu
 g6DOypRrw/kXEA4n6+9YVGWjkAiXzqt41nbkaUw==
X-Google-Smtp-Source: AGHT+IHuei9cSteH/A4mQ8tGokXyI8WejeGtf2o3u3B0yT5hvLrRj3UV5f5zbG98ZxwHbe98Gp2+giMbUEY+VqeSeS0=
X-Received: by 2002:a0d:e8c4:0:b0:609:845a:4a89 with SMTP id
 r187-20020a0de8c4000000b00609845a4a89mr16100721ywe.39.1709753844667; Wed, 06
 Mar 2024 11:37:24 -0800 (PST)
MIME-Version: 1.0
References: <20240306193515.455388-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240306193515.455388-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 21:37:13 +0200
Message-ID: <CAA8EJpqATJdV6f7Yi4gDeSpmgd45TUxqFmtk-nniPe6EhtFtXg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: fix typo in
 dp_display_handle_port_status_changed()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org, 
 swboyd@chromium.org, quic_jesszhan@quicinc.com, quic_parellan@quicinc.com, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 6 Mar 2024 at 21:35, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Fix the typo in the name of dp_display_handle_port_status_changed().
>
> Fixes: c58eb1b54fee ("drm/msm/dp: fix connect/disconnect handled at irq_hpd")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
