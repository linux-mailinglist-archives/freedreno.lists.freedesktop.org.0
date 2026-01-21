Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEbLL3vacGnCaQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 14:54:03 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D7E57FEC
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 14:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCAB10E7F1;
	Wed, 21 Jan 2026 13:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=fooishbar.org header.i=@fooishbar.org header.b="EU3Gd77m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C9710E7EE
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 13:53:59 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-88fcc71dbf4so49903786d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 05:53:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769003638; cv=none;
 d=google.com; s=arc-20240605;
 b=WRpky/di7I91KLAstwbABWCey/SJG0puJqletO6KboSNzNYtEZWwszBCSu2Re4/5L1
 YmjCN8Knvwqb22qzeQzvnJ0FZf/7+EgLBJsXbeOQuSRqcnqDekeSh4VBcwJe5jc4AMSW
 eaRx+NDjp3tjva0ULHUYSb214NQNoq73B7EZTy+7Y/sfrAkYfAd3VGH7LBy5B7UNk0P5
 SjKIwZeMeXcLTZvf1LDfNVY9APJzIjC7nbl+9CD5B/qTgGXlBg7VAb5jmHtT/GZZ4I4B
 rO/HXhTONUSeEPHkIZdnYc45ZOt8O/JPLmIl65L4Z9TfOlHporAxukrvEcC5SNL6/0nK
 c/lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
 fh=2xdodn2mSptSjN9wgfvsPcFo7BGsrqMaCBdu4LYFpV4=;
 b=ab9hHUfa1E71U3Dn9bKUlEVWQTXS170iliWNtT1Jm5SB/jTkQmiPVA1zD2Etxzoi6k
 86VsG3N3Drr3KtFy9jOrD553dAgk2Tv3MndJzjjfJL44DUYmQQd+sJNylKl63uZXi1gq
 NG59yB2C3I+2XgQDMh1jXHrnZdbSStaHXFONmopZR21q84vk7mGAL4ShMJOu2rEHW/Tq
 GO9ZXnYNoxKVPT25paUZyB994+IkAPmGBWHdclkw7/iH1zF/Q57bUFfYd9HZD+xz2fux
 +cMIwtrMAsg0FTDi+sB1Pp+z3G+AVRWMbOsHYrVOlBThjeSPYNmV9K4Rs1nMd99IRh68
 EtbQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1769003638; x=1769608438;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
 b=EU3Gd77mS6YFBDGGMtoY+oihLNoR0m6OlAoe0UAnxx98opmwZDYdE0C2lBCAm7oZvN
 gXZaK2fSJT+xlQ/a1xcj8gdI/ZJUEgD7GGA2iG7c/ai/9tLOR5juxjuDSGbJ+uJxh5Re
 wRjtCCqygK0KIFxvkrhHonFx7cT8lAf+6nOcqL76GiXtZH+9Tj3k2tV57aJnaLXG0l6K
 994ggSIK4CvZc9CC/RSkXX6MgmygUbdqh1TQvl0LOOnrcMd8oMWriLuiqqzV1txcWj7q
 d7CI+Lw3N80HYpfNRpZ1QxTNOPlW98Xmt0Ucn1wIeIKAswfL6Hzytl4znFdl8KxbJYic
 Pf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769003638; x=1769608438;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzFjOBpiJBGJpq9W2U1Ixpmg9BraukGH16/LLRJVX8I=;
 b=sRo0axvhFiGcK5+iaQA4Bsz9QGNAYBNczNx3IBkw+FsNry//IAWhpq/GQaDLV0zG0D
 YHnaFfWp/7t9ZrE+vLCVjs+zTTLAhoIM49QKo/J9aevTxt6m6tRxQxdutf4gFlan/crs
 qtqCCZYj7FLTatNcw7KQcP5+hK4q6aN/rvGBDmf5mQDjOOBxP+o6reE1UnNKQyyv+wfO
 adPWjJjNGlKT8CJjKGPhuMPLvtkdVtKgTDvwlhlOJYbTbHM0qWqNhH9H8pVIxLhn43vQ
 ETqoW4jN9hjLoWOTHsYkXQXsZcDPangYLuF7eulw12298DUq0a5ysT9JfY2W6g5ZMxcW
 52aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzwltVfk8o4ZTxDwvBc4BTCPS30D/Wgk5hWmjWCk+4jQZdiJVpdcog+9e5SkmOHZXIFRfglCOfV2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxygBv/o3JxK4l4DVeL+cUGHI+simXJiVNTZAA0jt/qprmSLP63
 J3jNkBkpCvC9ekOZ4IZT6Tj/GYeKIFmj7UhpakszZDfnCbMkF3TjCkcCGRP6tKQy6B/ZxKA1pIq
 7VedGFvdXo4/n84p8k/6Y9lWg9noa64MM220d/QCWOg==
X-Gm-Gg: AZuq6aLowPeTOxG+Uzqr5lHCwpkKnn+v08mbGhAWrMNSVD/wMbpwayBlHCvXX/Zh8eg
 mp+8LGdz4bUnGUqMoBLI7r1MKAxppZIWe8k6ZcLDowjmAPMidutT89cWlUHGH6JjDSuMbYObBMw
 zWNZaUl4q1cir+2CxtpUBs2eGfXzJZqjJZXK5094fjDX3XtGmP9GUZbk+MX75jwDUJR0rJPvfvh
 citR/ChFj6AZhLLclWNHKfJHsnm0HHb+rDb/IJCcjVqjVSz/DeqOa7O777kmTom/4VNdKc=
X-Received: by 2002:a05:6214:20c7:b0:88a:2d3d:7c30 with SMTP id
 6a1803df08f44-8946391a3b4mr81353256d6.55.1769003638378; Wed, 21 Jan 2026
 05:53:58 -0800 (PST)
MIME-Version: 1.0
References: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
In-Reply-To: <20260121-dpu-sc7180-ignore-gamma-v1-1-84f2cc2beeb1@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 21 Jan 2026 13:53:46 +0000
X-Gm-Features: AZwV_QjWvOm4jhP_1MnP0BOpEkMXmJHcaqwrd7h9g8bJmPr6DwH6VeirzSgZgdA
Message-ID: <CAPj87rPFGLSO5cecUstZHEYdjjihK2Yx4d8PGCYirNixxKEt=g@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: ignore Gamma test failures on Qualcomm SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Helen Koike <helen.fornazier@gmail.com>,
 Vignesh Raman <vignesh.raman@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Federico Amedeo Izzo <federico@izzo.pro>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[fooishbar.org];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:helen.fornazier@gmail.com,m:vignesh.raman@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:federico@izzo.pro,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:helenfornazier@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,collabora.com,linux.intel.com,suse.de,ffwll.ch,izzo.pro,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,collabora.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,fooishbar.org:dkim]
X-Rspamd-Queue-Id: 13D7E57FEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 at 08:41, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> It seems, on SC7180 color conversion results are not included into the
> CRC calculation (unlike SM8350). The fails for SC7180 already lists CTM
> tests. Add gamma-related tests too.

Ouch. Thanks for tracking this down!

Acked-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
