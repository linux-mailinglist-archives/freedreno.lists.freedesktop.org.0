Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CF11DF577
	for <lists+freedreno@lfdr.de>; Sat, 23 May 2020 09:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CD76EA35;
	Sat, 23 May 2020 07:19:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5513E6EA35
 for <freedreno@lists.freedesktop.org>; Sat, 23 May 2020 07:19:39 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id j21so6047206pgb.7
 for <freedreno@lists.freedesktop.org>; Sat, 23 May 2020 00:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mQpwDorfwvq+V62PfvwOYJvrHs3QMzFsZXgFJo18jk4=;
 b=MSrBnupi+5YHYIwS9y2RbUaGZ+TCSJcSu1bQ5t995mrwnPtUwyNeHzimkw3adTJCXH
 TaKBt18aHyJ9P8w3pjxzliEmQ1b7kQZ46QssUwJBAfUqLfNiws0JdQPs93NWG0kxVE3x
 uaJGm00uYa8KC7gpxNnpYix0fh+2eauT3zeSgFZ3wk2pD06Om/E402x9vAa639q68p4b
 LRrH3rCbfinfjERxe8qqBRejbiGwQ1oSi/6CjN60NPl9sBlLZW3NUa/Vef/zLGm+r6wz
 2tZY+UPo96qmeCB3PT6R/srJXa3q1q0S8irkCs9F/nA6Ki7B1Cwz72RdQq7Vi4pTBcCw
 WCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mQpwDorfwvq+V62PfvwOYJvrHs3QMzFsZXgFJo18jk4=;
 b=G1SVG4+PnQdMYoPitKT2AqQCLKMb9UM5RXcKieoTRknGFt1Mr5leW6DN8S/IObZoZJ
 BQB7tXx3pCpoG8w+FjRBbe049T9TQIuCdvq3CN9r4g2hP6eFg3HBuuGRfvKdld5Cd7mX
 qjUFxxTC9YQd/VRF7B1+gGtBqwBgkV1TKNOuhbipvTbrDDkvAp9BifLW+hSQtouANo0H
 osIalJ3/fwFYs/rXZrRJ3sbEzDKWgT/QrIZcnyypK6Y1n0qQ1/nbpiNvRO7YtxRrOmWk
 ciFBdpGeSlk6/w7lL9JmmvHcA0vRkxJdUwvAux2KzXApiQenNOv9fu8cCuPsfUiVTey4
 yQrA==
X-Gm-Message-State: AOAM533jpwGq39VvVmFEshu7q67+65UkoCyELYVqicZe6ISsT2q5uYjE
 8VttckavWYExeszxcGTaTtdaQQ==
X-Google-Smtp-Source: ABdhPJxqFZXbgyrGG2llkCELkJ4vr8owyGAmFuNdn5IWKK4N2BoHTIjn1LpADdQE5iBYiIrZ/JTh+w==
X-Received: by 2002:a63:e50f:: with SMTP id r15mr4250466pgh.192.1590218378840; 
 Sat, 23 May 2020 00:19:38 -0700 (PDT)
Received: from dragon ([80.251.214.228])
 by smtp.gmail.com with ESMTPSA id d21sm3969329pfd.109.2020.05.23.00.19.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 23 May 2020 00:19:38 -0700 (PDT)
Date: Sat, 23 May 2020 15:19:26 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20200523071925.GA28198@dragon>
References: <20200522220316.23772-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522220316.23772-1-jcrouse@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Freedreno] [PATCH v1 0/3] drm/msm: Cleanups ahead of
 per-instance pagetables
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Marek <jonathan@marek.ca>,
 Konrad Dybcio <konradybcio@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Brian Masney <masneyb@onstation.org>,
 freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Rob Clark <robdclark@gmail.com>,
 tongtiangen <tongtiangen@huawei.com>, Daniel Vetter <daniel@ffwll.ch>,
 Drew Davenport <ddavenport@chromium.org>,
 Wambui Karuga <wambui.karugax@gmail.com>, Enrico Weigelt <info@metux.net>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, May 22, 2020 at 04:03:13PM -0600, Jordan Crouse wrote:
> These are three cleanup and reorganization patches that were originally
> part of one of my many per-instance pagetable stacks [1] [2] but make life
> better in general and can stand on their own. Send them now to get them
> out of my other stack and make that processs ever so easier.
> 
> [1] https://patchwork.kernel.org/patch/11355255/
> [2] https://patchwork.kernel.org/patch/11355259/
> 
> Jordan Crouse (3):
>   drm/msm: Attach the IOMMU device during initialization
>   drm/msm: Refactor address space initialization
>   drm/msm: Update the MMU helper function APIs

FWIW, on A405 with glmark2:

Tested-by: Shawn Guo <shawn.guo@linaro.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
