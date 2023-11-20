Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD227F0D6E
	for <lists+freedreno@lfdr.de>; Mon, 20 Nov 2023 09:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8603C10E32E;
	Mon, 20 Nov 2023 08:24:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5002C10E381
 for <freedreno@lists.freedesktop.org>; Mon, 20 Nov 2023 08:24:48 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40859c466efso13782455e9.3
 for <freedreno@lists.freedesktop.org>; Mon, 20 Nov 2023 00:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700468686; x=1701073486; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LiwLz7rgORSXU5ZDowGagc2wpV+uTLoI4pnI3SOTIak=;
 b=aBgM2CXGGYAyyiC/86W6lA4q7BUo7uqJRH7OG9UdQLbWAYWGRVOueG3PnqGDUumfAT
 ZX20PptvwatP/c7s0b7WEQ1m5XFuF4cJYhVZNIAKzfnuiorG+u9B0dseH/56seIQGzrJ
 eJzuP/c76lmJ360ZSPjJhIUkPsriqQ3VG+UibGX3nM1x8xyO2rxnI4/gNznyO6OktHyh
 lzCfUKBejU/pOmxmH7INs20WeP6tHiIA3nRx3TkmxnGSyxFnsSyH37trSlUO1ljdFmww
 0+gMOOOTPKTb45FuWXwcITRKKqtSUv4mzBle43FS9zUunUI81E4cSXrBBa0qkgtj2A2a
 7G1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700468686; x=1701073486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiwLz7rgORSXU5ZDowGagc2wpV+uTLoI4pnI3SOTIak=;
 b=VTIX/K6onAJWYsjanzZy7lIeowEapWb4c3ioMnGDjpFtiEMTVngNnibMEhz6WHVZj7
 OsD0++E8soxM8AZeSMwMiAGefUI7O77v1sge30mUvv4YNgM/xLQ6XmD4twhJq7iuOUqc
 5t6WO2xCfDd7v+6xB0D4tJ1ufLVfSlBXi7wHeH+gptpggFU29slh7niSncQ+KCZCIP19
 meA3go8xQ3zAbi9NxvcqtLP3B7sixpCH3FOKYri240+4y4/NJKciObovhoA6Qved0i2b
 CPNJGMdDkeyzrF8kkxp3qInNdmvkzt/lGqOzZjope3Gwu7JAh4f+krVLYAk2dZg65vfP
 SvwA==
X-Gm-Message-State: AOJu0YyNKhw5go8GE019cifMbkVtAdB0ckLHzrsLJW4zNZFdZkj8ATJp
 qMm/qXAUrl5nBISPPO/n2EJHGg==
X-Google-Smtp-Source: AGHT+IFLuFWYBRvyWcbXSNal7y2L0gxiFMY6jL/MShNjQA43ddXnWWdRUS33btuzM+seVvagiGyBaw==
X-Received: by 2002:a05:600c:3504:b0:409:5a4e:512b with SMTP id
 h4-20020a05600c350400b004095a4e512bmr5583059wmq.18.1700468686642; 
 Mon, 20 Nov 2023 00:24:46 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b004077219aed5sm17387903wmb.6.2023.11.20.00.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 00:24:46 -0800 (PST)
Date: Mon, 20 Nov 2023 03:24:43 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <23209856-0459-49bc-99d0-cab66e1c098a@suswa.mountain>
References: <ZSj+6/J6YsoSpLak@kadam>
 <095b7283-3555-cc38-a73e-83efec8a9bf8@quicinc.com>
 <62943ca3-26ac-8712-2caa-102dc98f099c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62943ca3-26ac-8712-2caa-102dc98f099c@quicinc.com>
Subject: Re: [Freedreno] [PATCH v2] drm/msm: remove unnecessary NULL check
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
Cc: Su Hui <suhui@nfschina.com>, freedreno@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 01:05:52PM -0800, Abhinav Kumar wrote:
> 
> 
> On 11/1/2023 12:23 PM, Abhinav Kumar wrote:
> > 
> > 
> > On 10/13/2023 1:25 AM, Dan Carpenter wrote:
> > > This NULL check was required when it was added, but we shuffled the code
> > > around and now it's not.? The inconsistent NULL checking triggers a
> > > Smatch warning:
> > > 
> > > ???? drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
> > > ???? variable dereferenced before check 'mdp5_kms' (see line 782)
> > > 
> > > Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the
> > > _probe function"
> 
> A small error here. Its missing the closing brace for the Fixes tag.
> Checkpatch cries without it.
> 

Sorry.  I must have accidentally deleted it after I ran checkpatch.

> I have fixed it while applying.

Thanks!

regards,
dan carpenter

