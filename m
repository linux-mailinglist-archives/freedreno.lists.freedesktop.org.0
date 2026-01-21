Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCSJOQRZcWkNEwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 23:53:56 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 533ED5F1A4
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 23:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2827410E289;
	Wed, 21 Jan 2026 22:53:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iHOtLHV1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A34610E89F
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 22:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769036032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
 b=iHOtLHV1w7oSuPv+8F+UuBYkNIL+S59QcmkP0xKN1x8tnPUz2hkM9BDiW8ESUku4bt3n3V
 7SjcjFWhdZdVwIE75Xlyu/3mmaYW2VXPTgmxbr2Szk2X59tO/1nrg90gCqlT+QtMgxZEZF
 SqqmiRbwXzm/wY8vfNOt0LIgaJMzPk4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-DCg8VAapOvW_dl8-PfQ9tA-1; Wed, 21 Jan 2026 17:53:51 -0500
X-MC-Unique: DCg8VAapOvW_dl8-PfQ9tA-1
X-Mimecast-MFC-AGG-ID: DCg8VAapOvW_dl8-PfQ9tA_1769036031
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50142190becso12789061cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 14:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769036031; x=1769640831;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UiEPj0ZcSawildEgR+9wJ/AtCxMbPbzcmfyb7UYIQ4E=;
 b=Oj6pjH2Qq7Cd58GOLBFoa5VJwAQh9z11wAj8XHpG2+7FIszz4bpCt+BlZJVZGSH89T
 Lno4S5TPv1VSdFPfzX09XVhdyhNwURPZPMIxEmqKnTRO+avE9vkJsuSAroKcdH9nOjCc
 QRHxESyIk/+Sf6VLe3RWt/PGKy5SxhocG8eJZ9Bq6wDPQEzqanoqFuSX4ing1ULixP9P
 64DozQw9qKYOsk135KUdBgqM6/aqCI90L/3t3TdqOeDGfgLPXw9gYaoYD0SIkaXJ+/cs
 bhz4HY4gzBW5r7NT87znVNGasiDjHKlVo71UwRaUFdaFeKjePkoNoDlYz6ochIwei9L8
 nN5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqQKDc0gvMjRvJEbvwrJhV3fU0ezMS+C6rciq9g4WOmUP6n8y5vn7SI8glNcU5nRRj0kvTLxxku1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwW7/Qhv6LvFj9VbIgfEVbLmWmXkJ2feT52z6ekOsc5HhRb+RyM
 VqvXnGGeSPMjpq74ZTxu81pow83AwsEl15l257X2HDLJtQrzDKGQmj7P74ymVO+5NXxcyGecssu
 RBXiWp3C2TTGIn9ngyXwPE21RCnDNytkLJx8tIrrRmOYarInDjFCvBkof8MY9iG8wE/Ju1Q==
X-Gm-Gg: AZuq6aIRWfJVC5sE/rKjtV1hJ6P6yBwhhJ2FS+4YQjAk8vugy2NM6Ev4cLRJEGCqyyh
 0fq6HVtLRkqe6rv0+LLBXGA4fwZwyB4NdLE5fskh++7R0W9qoANg/JcAzCdLCCSo6eXKlN9xs+7
 BpCk40WxrYm8MQqd9zG/7sumnASNd97+31YsWQKMETbfwaah7em2QWLV1YMQvME4Y+KxbPL7YAP
 VfskWuulCaxRlUojfwM/tHXUPpBn37ERzSQMrexFZbD1v5PeL9IDmCXWVgDFQO2ZwiOmAHDEqmr
 xuYUhdy56hdBfw3yvFxoiDwWr5TLw+8IIsMSWbXKIodkZ1L9L7pWa+6X2IilzU64EIEyRNjYOtu
 ADa45vBAH
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id
 d75a77b69052e-502d84b0ca5mr87957421cf.13.1769036030820; 
 Wed, 21 Jan 2026 14:53:50 -0800 (PST)
X-Received: by 2002:ac8:5fca:0:b0:4e7:2210:295f with SMTP id
 d75a77b69052e-502d84b0ca5mr87956771cf.13.1769036030338; 
 Wed, 21 Jan 2026 14:53:50 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-502a1f1abb9sm117138811cf.30.2026.01.21.14.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 14:53:49 -0800 (PST)
Date: Wed, 21 Jan 2026 17:53:44 -0500
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
 Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michal Simek <michal.simek@amd.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate()
 and friends
Message-ID: <aXFY-FxqeBv4BsHd@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: akOUoeiXVO285OwQZ0NOz2X7h4lXjDVw9OPf0C4MTb4_1769036031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:unicorn_wang@outlook.com,m:inochiama@gmail.com,m:sophgo@lists.linux.dev,m:wens@kernel.org,m:mripard@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:linux-actions@lists.infradead.org,m:keguang.zhang@gmail.com,m:linux-mips@vger.kernel.org,m:sugaya.taichi@socionext.com,m:orito.takao@socionext.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:vz@mleia.com,m:piotr.wojtaszczyk@timesys.com,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:michal.simek@amd.com,m:robin.clark@oss.qualcomm.com,m:lumag@kerne
 l.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:dri-devel@lists.freedesktop.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-phy@lists.infradead.org,m:jernejskrabec@gmail.com,m:keguangzhang@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com,gmail.com,lists.linux.dev,kernel.org,sholland.org,lists.infradead.org,bootlin.com,suse.de,socionext.com,nuvoton.com,mleia.com,timesys.com,linux.alibaba.com,foss.st.com,st-md-mailman.stormreply.com,amd.com,oss.qualcomm.com,ffwll.ch,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,linaro.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 533ED5F1A4
X-Rspamd-Action: no action

Hi Stephen,

On Thu, Jan 08, 2026 at 04:16:18PM -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.

I sent you a GIT PULL for what can go to Linus for the upcoming merge
window from this series:

https://lore.kernel.org/linux-clk/aXFYU324yQ6uBmk0@redhat.com/T/#u

Thanks,

Brian

