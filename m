Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFZIJrVqfGn+MQIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 30 Jan 2026 09:24:21 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09707B84DF
	for <lists+freedreno@lfdr.de>; Fri, 30 Jan 2026 09:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBFA10E924;
	Fri, 30 Jan 2026 08:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YQdWQF6C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830FC10E926
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jan 2026 08:24:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so1171419f8f.3
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jan 2026 00:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769761457; x=1770366257; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kSHfEKQ3xKgmT9AN7R0YJI5063g4zHXX2+tc+T6cmxk=;
 b=YQdWQF6CUwTL19goD85GtvmZIqIOxI7yUfBuPp357Rti5x8grogyC7hiaJBWyd29oo
 mEGABxoW5EblomF/vvIj4cJwxOj4HKi0Ho97fDTHC9pmO4EKPLB7/44T4Og+AuorJMwv
 5VLfHW1y/HIbhe0wKkcz1Iffiw4P/W4WqRqceUkaqinyRVsZyETQ7kp4zkDH/rrOuMbG
 +N6BADZcfxGw0J1kHgQoTxfk6YrepbM334s08zhvIYkNRv1gkkKfe3+VDISe5w9dQ+/k
 24Ck8/NF2ZoisGIhAk3b+JMkudBugu/ukTjxRPw7npnnNdqqCgKV+0ltEa0AVYh+d7kY
 OiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769761457; x=1770366257;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kSHfEKQ3xKgmT9AN7R0YJI5063g4zHXX2+tc+T6cmxk=;
 b=s1jzVyJ96Ymyn6H62TAX3VcLv+CfxKOnwSzzJJCVIYbQ2ZNWi59n8xn/bjGGVhP0p0
 iuOOZsBDjAopQrXy22dhZqqdLW7FrfwmJViLAREksgglv0WRFsI3/xBIRzgbSVjWLqIz
 ZUx5qjTqlX6ICf9tV3wFqmU+Kk7z+U8KUTtt2Bev9QGIQ4nAVcoH0NI2d0vq9bEfVVOi
 pfYltzwwjo9xzAEhtDcrr6vxUouVzGZ5H3ihLCb3XuEskSGPUvwWHof1qsZLCOizKKmr
 BSNkvraH4W+EWMxwVnbhtgxl/WsqCFdHeq1NdqU5kWf3b9JLSfs5mM2HyEkbv/8I2TbS
 qbLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvT7XHPQ4taRy7FG0SAR1jq3vBF6NRiL0QyaJryf2W+tCAc1pIWeDD7lELXCQZIzYnP4voYc2+KB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9KaVabpBinf0Sf7jCHX6R43VCZStB0mm4WufgWIDeioxII789
 ++FtMuFR9AWL09USMe5YBOFI2H7WX8izCT3P+gGCy7rLMTD3y8iQBOuxYr7tDO507/0=
X-Gm-Gg: AZuq6aJsA24DLj68QXa+cRrOjLIYv+nobQlfVGScZwuISl49J3gRlrF4GjTGe3ldMla
 MYKRHA/EfPjumgKPIg0xYCnaEVBeFelQoE0A4h/NH7AJWUYICSLrYhUZgmXmlWfJHvwANzSFXoX
 EH2vOxMq6k5BCsATioaBV8WwoV7Bv7D+HhzB+JEc649N4GCEQPZjfpOQKIPfBH3NLLOoSxb6t8l
 YQKBbfjFFGRWvatnhtJ+GSGUkvbNIeoMmN0SeDQ90a2Rav5wld9AsYql+Uzx/rVdFOUT4O1ZOdB
 Y1wNkmKoKWDwtb80XWVWSTi9ZDgQnO6tlLItusiOjKCq5KNkfL1UNh0lyceclqona3wK6+ztSOH
 gSDdf4DNZYjNAoci1JGaLnFFK8LUZC7mPtZUDcIStEVL/KYtzjKDLQjW1kWv872wwD4QjpEVlss
 GZGUrVHWvlJFMQWjBanCsUokCdYgI=
X-Received: by 2002:a05:6000:220c:b0:435:8f18:9539 with SMTP id
 ffacd0b85a97d-435f3a6cd84mr3201514f8f.9.1769761456834; 
 Fri, 30 Jan 2026 00:24:16 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1354d43sm21835959f8f.43.2026.01.30.00.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 00:24:16 -0800 (PST)
Date: Fri, 30 Jan 2026 11:24:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sunliming <sunliming@linux.dev>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <aXxqrD3ZzK_dTAmb@stanley.mountain>
References: <20260129024919.30449-1-sunliming@linux.dev>
 <aXsHSTHHP0eyI-Pk@stanley.mountain>
 <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b62dc0de-b39c-7515-25d8-6e6817df3f17@linux.dev>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,linux.dev:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 09707B84DF
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 01:30:35PM +0800, sunliming wrote:
> 
> On 2026/1/29 15:07, Dan Carpenter wrote:
> > On Thu, Jan 29, 2026 at 10:49:19AM +0800,sunliming@linux.dev  wrote:
> > > From: sunliming<sunliming@kylinos.cn>
> > > 
> > > Fix below smatch warnings:
> > > drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> > > warn: variable dereferenced before check 'ctx' (see line 159)
> > > 
> > > Reported-by: kernel test robot<lkp@intel.com>
> > > Reported-by: Dan Carpenter<error27@gmail.com>
> > > Closes:https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> > > Signed-off-by: sunliming<sunliming@kylinos.cn>
> > > ---
> 
> Previously, a maintainer suggested that the name should match the email
> address,
> 

Yes.  But normally people change their email address instead of their
name.

> but community patches have consistently used the name "sunliming" since
> then.
> 

Consistency is less important than being correct...  It's just a weird
thing to say.  Are there other non-community patches with a different
name?  It's fine if that's your legal name and we have made exceptions
for people who aren't able to share their real name because of stalking
or whatever...

regards,
dan carpenter

