Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAtrH1EHe2maAgIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 29 Jan 2026 08:08:01 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD921AC6DC
	for <lists+freedreno@lfdr.de>; Thu, 29 Jan 2026 08:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B452410E7D4;
	Thu, 29 Jan 2026 07:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FWyaRwTl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785C810E7D4
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jan 2026 07:07:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id
 ffacd0b85a97d-4359a302794so427557f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 23:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769670477; x=1770275277; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nLKZ/+6JwT2YBvhO87EM+NlzTMpXl06Qt/e59HknqH0=;
 b=FWyaRwTlgUwzXVDNxpWBUe9emhbTyDoGFr0Lpy3BDozVgo68tco6a4z9NkR0/BZ0Gq
 sT1c5I/Ki2dheOo47gWtB2dV5Zp3OXFv/dOZkyd1vPCOAoYuroeU3PS4kM3iIGLcFlkD
 gptKaSn1LNICDQlcJKUjJhAT1n3Yiyxj7eEoofQ+wIx4Cnm8MPRRHDSm7gCzBasGstq5
 HeZHLaPqUmWCG8O/VqETfmQp/A1p3j5mJxGGNhkaQoH+bpr/QoGm5m9X5korjFL+SKf2
 kgLN0uuayPCGTidCfCAj4F7x52/xBnZsRfCybAixY+okESzkGLdyTPEaUd/ukiurCf9J
 Wiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769670477; x=1770275277;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLKZ/+6JwT2YBvhO87EM+NlzTMpXl06Qt/e59HknqH0=;
 b=VQqfZ1xjlRYCbtC6b/nTgBj1U9NIyKieKnYo4fz+qNtv6UsGjM/MQeZc+/v2OJlvh0
 CkFpRAYTkmXWjw7C7P8UQ5ccjgBinmBkzUgb09dsynQYX38xLugPJ3pRA09lttE87lvl
 1KzvI+BazQawt2Uf/lXnnZ/fY/StPpDJVtqCfrmD/AwetoO8l9NHsAqCA9STXnoxOfxM
 McYXSc7hi4HmRdmuT5QVMjc2ZP+5mLJNy3YxNz2FyauHE1f01rKjuUytQ0pg1KZxA+TV
 3Lvq2DTff89ZhNUsnZtilgBwpLOOm3tfqHHA4EXvwIF1iEpvY0DMW0+25T5EaHuGBX/2
 7RLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4nwG4I78LapYtNzMguxWGspg+44mHW6zyOKyJ+2wyrAciYcJwyVRux3a55wpqCaX7skwrgyZmFn4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMjJSfrT2vryVc8t8y9fLtvIcFwVmmqPSVlMKmqQy0VOLsJFAR
 0hXO0oYwolGLsjSy+rW66BTAqDjVhyAJkpBc6zEg4TU6M4v60uJ3cfqEKV/jnly8zq0=
X-Gm-Gg: AZuq6aJIU/yqc8GdRTOPX0GvwhcSTb4PoJqeoiDz+q//hiKyofU/kbp5yI2sqEmrifw
 hEbVRsV8fxVNPoS7qrTQYKRkXG6emJQXfgU9MO7T9TGBT+zq3VVykUU5u9DwBzHhJONOqOAhJC9
 qQKEIyrEo+uPZXu2ahQl9HLw7vu7o3bzv3kt2SSQkM0SC9Co+jHf4vDEgTC8fTZrp9QZ/vflIlG
 i4N1hOUWfmjINSXgazQ4SqIlZ4B8i54oKXZkHrK4WreNevuPaFI09jTuYD3q40F1uyGD7l/Vgp7
 dts2mADB7attgjKamfi7gy8AxhTnlmAnH/g9Kadim2MEgrxXxVUiqtoJ9zuapBftXl/zlO/eJph
 OZ2V3WCxA41fegql2LY/bcXwYS4GhjYGrZUP39nT+Z1S7+EFsWqk7j2fN3LOrsvT1cJGJKoVZyX
 UioJMECqg7evC8HV7p
X-Received: by 2002:a5d:5f54:0:b0:435:94c4:649c with SMTP id
 ffacd0b85a97d-435dd0b678dmr11429356f8f.30.1769670476703; 
 Wed, 28 Jan 2026 23:07:56 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf16sm13036791f8f.22.2026.01.28.23.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:07:56 -0800 (PST)
Date: Thu, 29 Jan 2026 10:07:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: sunliming@linux.dev
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, sean@poorly.run, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RESEND] drm/msm/dpu: Fix smatch warnings about variable
 dereferenced before check
Message-ID: <aXsHSTHHP0eyI-Pk@stanley.mountain>
References: <20260129024919.30449-1-sunliming@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129024919.30449-1-sunliming@linux.dev>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sunliming@linux.dev,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:sunliming@kylinos.cn,m:lkp@intel.com,m:error27@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,ffwll.ch,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org,kylinos.cn,intel.com];
	MIME_TRACE(0.00)[0:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,kylinos.cn:email,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim,linux.dev:email]
X-Rspamd-Queue-Id: DD921AC6DC
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 10:49:19AM +0800, sunliming@linux.dev wrote:
> From: sunliming <sunliming@kylinos.cn>
> 
> Fix below smatch warnings:
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:161 dpu_hw_sspp_setup_pe_config_v13()
> warn: variable dereferenced before check 'ctx' (see line 159)
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202601252214.oEaY3UZM-lkp@intel.com/
> Signed-off-by: sunliming <sunliming@kylinos.cn>
> ---

Could you capitalize your name?  It's supposed to be a bit formal like
signing a legal document.

This isn't a RESEND, it's a v2.  A RESEND means we accidentally ignored
your email so now you have to send the exact same email again.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

