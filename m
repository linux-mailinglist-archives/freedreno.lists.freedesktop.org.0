Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F86789A3F5
	for <lists+freedreno@lfdr.de>; Fri,  5 Apr 2024 20:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A8210E3EA;
	Fri,  5 Apr 2024 18:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dP0/hIrl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7F310E3EA
 for <freedreno@lists.freedesktop.org>; Fri,  5 Apr 2024 18:16:33 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dd10ebcd702so2734045276.2
 for <freedreno@lists.freedesktop.org>; Fri, 05 Apr 2024 11:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712340992; x=1712945792; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8b1sNjLbSX+4p2YVJs2q/ZYirydHfodZOqbVbZl7vM8=;
 b=dP0/hIrlHxjISj3Mq5RUq3Pam4wqJEJqBPdEiynmpvAjZk9Yu31EUlJs3Ai+j+AGOU
 HLYubhuRBY7sQRTgJR5/tj0ze+VDj+S2hPl8ZA6SnrEG0VWoXTq2cOoZqzUV3QP6I6VK
 T1Txd0yDz8NtYlg79s2Vtg9iQz8msDw+NbhGmT1d6wbaRpQjgT9E3qeVrkqn0JZiCW5y
 7l2Qs9kDmIYkRwi6823OccNXVuO6k5dGF562m6E6pQlxOMqJw/9xkevUzgk+Q9xJ/A1I
 jlDp5vRR6bLejOEV6Ylw0fY3/E3bwuwXl2BVX+PIz3bO8+d8Wc5HH9+M8BZml/8N09+f
 g/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712340992; x=1712945792;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8b1sNjLbSX+4p2YVJs2q/ZYirydHfodZOqbVbZl7vM8=;
 b=bbJXFkjQ9zuNhYk5BAjm6dDPgfv+xHu5NPxVkg83+TVoXpXyHcnzXs8SmWk5KY39B4
 KgzmBUJCzdctX9Lp76TjawVfMdKyPx33LQOww6M6LivfwgDBYI0t0sS3EOh8Zs3U87MJ
 Y2CZJDknzRohsJDg9spZ3aEauQC6r2uye/oxscwDEaXDUC/zmu9u/m7lwXJb8XlTPBQM
 FuAvJYoDyUVbwelsoo1mT6OAFUViMr83/HxJVEJMjLYTH2/5COTR9LmOaBsdKBwuOKc5
 Bylc2zU5FABWlNk92avZL88c67DdgYGmkbqr2Mzkik7VPHehVdpkRiytawxR6nnlQVlw
 U5GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLRAAWClsngkT+7Pa4jIPTQqLIZK5l8eOLPqJ8oCKkdB6S7eLeBGYCvpWNtghqk2SVQyA25bTFhK9S8mcoCmwvq0Ch5Pe0yVwhJIKHmH8N
X-Gm-Message-State: AOJu0YwV0TPbCQ000d3VsVUTRwJgLQfyd+0JooKHV+0UVcMgZroiqHfS
 zqF4/wBzvZAbH8FoCsYMje9GsVaneVzAektaKYwdgnoQErEeNo0cdnHugr3/XSULaZeM6BUbZdI
 Y7KQ2CvRAq33hqaWyeDrIQUYOCSvtdjp3xTTcYg==
X-Google-Smtp-Source: AGHT+IFxJQpkLQMcuCl47bcv87YmmrC/kzaXW/bMMXwLkVUUAwKCx1eyJZ5ZzM/2byx+B4ZvCfzB9dPUG4xIYtBTXo0=
X-Received: by 2002:a25:d34e:0:b0:dcb:fb49:cb96 with SMTP id
 e75-20020a25d34e000000b00dcbfb49cb96mr2186626ybf.31.1712340992533; Fri, 05
 Apr 2024 11:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
 <20240309-fd-dsi-cleanup-bridges-v1-1-962ebdba82ed@linaro.org>
 <88b3722e-aa46-1ffe-9f0f-1939d43e0100@quicinc.com>
In-Reply-To: <88b3722e-aa46-1ffe-9f0f-1939d43e0100@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 21:16:21 +0300
Message-ID: <CAA8EJppbETLONx8pEdT1kT1Hp1i405m-4PfgumvvOa9N2mh6CA@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dsi: remove the drm_bridge_attach fallback
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Fri, 5 Apr 2024 at 20:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/9/2024 7:09 AM, Dmitry Baryshkov wrote:
> > All the bridges that are being used with the MSM DSI hosts have been
> > converted to support DRM_BRIDGE_ATTACH_NO_CONNECTOR. Drop the fallback
> > code and require DRM_BRIDGE_ATTACH_NO_CONNECTOR to be supported by the
> > downstream bridges.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 36 +++++++++++------------------------
> >   1 file changed, 11 insertions(+), 25 deletions(-)
> >
>
> There are the bridges I checked by looking at the dts:
>
> 1) lontium,lt9611
> 2) lontium,lt9611uxc
> 3) adi,adv7533
> 4) ti,sn65dsi86
>
> Are there any more?
>
> If not, this LGTM
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

From your message it looks more like Tested-by rather than just Reviewed-by

-- 
With best wishes
Dmitry
