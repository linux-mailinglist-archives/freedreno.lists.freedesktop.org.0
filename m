Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 097464D2281
	for <lists+freedreno@lfdr.de>; Tue,  8 Mar 2022 21:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9699710E25E;
	Tue,  8 Mar 2022 20:25:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD8B10E561
 for <freedreno@lists.freedesktop.org>; Tue,  8 Mar 2022 20:25:18 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id x193so548887oix.0
 for <freedreno@lists.freedesktop.org>; Tue, 08 Mar 2022 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=oDPDk3UmBsVk40ec9UZG1guo+bgLJlbyhqOvTa87J18=;
 b=ZEU3s/iBsPE/dcbZEncVtRdgyz4R+oUlZ8IFZd75aCfzqlFSkSNyCjKiT+LTsfYBHl
 Cm9iCylS8NjPhmqGyLleWV/AlIuLHWBBjfRO9YzBSGOiL+HUUoYiriTtZCjxZs0k6RSS
 JHDC2KWjdYFrWraKvKeVS8XH3ypl7yOLBoubU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=oDPDk3UmBsVk40ec9UZG1guo+bgLJlbyhqOvTa87J18=;
 b=iMcPNX6LO9uCy+2M/7GirHDHd7vVVgsYjlUeVTSQRN/3gSeMBtoY/bEELafyczrS7F
 FEKu2mB6uXwaCDS2WJ2D0NEX8ZLeqnH4WpKvTl1nyu12ACx+R8Y+A82X6NujH3JR9GRj
 lUJktklThew9Jb8ef0gMxVTZREmVxvHHW/2O/3IR81G8jDCNia8jUKeUzr6k2GPiHm7W
 79o1X0gD8lek47VOdhhH60wc4U8WOeI8hbgf8quZshcTyHX6Gf7CHUWDSCQShjsNoBPf
 Ezb6m1ZAgLSnrvtDOslQt+RX6atkr+1GGdBGd07M+swLfOEH/klwjgwBoG8E6mtzn/wk
 4A2g==
X-Gm-Message-State: AOAM530Fugcz5Hcdpaf0na8lpklFHXg2QKAe0y971Z+UjA/DVNQbkDdt
 RNKMIrzja6rrAHgDO/qNLugl7QKzTH4gmN/trCytzw==
X-Google-Smtp-Source: ABdhPJyfkvCfjSZ//u1fwsUJLWTGqZE5hW7zbIbFOcJy9M5AYS6WsphZTeYWH38/SUWdTsorovwAZS/YNjiEUrd/bVU=
X-Received: by 2002:a05:6808:220d:b0:2d4:99cb:3849 with SMTP id
 bd13-20020a056808220d00b002d499cb3849mr3846554oib.63.1646771117701; Tue, 08
 Mar 2022 12:25:17 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:25:16 -0800
MIME-Version: 1.0
In-Reply-To: <20220307133105.GA17534@kili>
References: <20220307133105.GA17534@kili>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:25:16 -0800
Message-ID: <CAE-0n51by--BL=+12LtVKRY500Y_c4tZHai--bVvMERGNaUg-g@mail.gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/adreno: fix cast in
 adreno_get_param()
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dan Carpenter (2022-03-07 05:31:05)
> These casts need to happen before the shift.  The only time it would
> matter would be if "rev.core" is >= 128.  In that case the sign bit
> would be extended and we do not want that.
>
> Fixes: afab9d91d872 ("drm/msm/adreno: Expose speedbin to userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
