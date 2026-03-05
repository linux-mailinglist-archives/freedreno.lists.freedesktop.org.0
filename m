Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OOMGsN+qWlB9QAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 14:01:55 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE98212498
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 14:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D26910E299;
	Thu,  5 Mar 2026 13:01:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637C210E299
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 13:01:52 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2aaf43014d0so59794015ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 05:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772715712; x=1773320512;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7IxpxVkGnClS/pzWnTPcTEx+bl+pPZR21vGpLksfVXc=;
 b=TlGoXYA+uE3rkkXvJSqBrREkmmFQUNKRX4QpNZVkn7xwNsYc/WwP9xLV+p2zIv8Ti+
 txK5qI1RABkqiFKqcUS5rO/KTLeOybIe9iIS2reEbhN32yfRYuWZaShBhf4HDxGnWXUA
 Rhg6uSbOvG5b6CqmDe4+xvFkWWu8WPhvFCrjY9ogNo8sB8Hd30y6ZLlRDu52gv//rSnd
 E8n3zWDs5VOHMnRXtYdhXoAn/AegVCEodMnC5QgoikREwXIQMLvg3cToSXdljbEAW/ma
 UPoiPibyQPmtwEMTRQcOoebNUWzjrIvF05qiA+QnotABDJTpxWOui585H05zJr8Sx+n3
 Ufsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjcpJqIIjKdi/zvvIJE/4pGvBmvu5KkeMFKiFxyN4nedy7JfQeyvXcBmtOTkE5AlQi3FSS7FO0+n8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyF5db7g+4UbCG0uJahVOfUJ0wZ3B6Wgr9RYFnzPDrfcJBZ2i+
 zGIYRVIpp5b/9nPehqIMzmeOgJI63j7fvOo/KyULwRMOgRRXCwE8DlwA
X-Gm-Gg: ATEYQzxQA0/DMGicwX0TBgZE90772SXXPj06GuFy+niDosP5uoXt7igVYIiLUNrP0nW
 yDhm95ZCdXBNsoh+viGXrvipM/FDvpGSus0o8BfZbJDzSb1wjvjBFcbpl1KpLv3qVE/0mGp2Xjr
 0V+VHeHVUoku59UBxMZCz+iOrKfS3ZcWsVjfPkXkNktcwkcOPfYZMwijvQXKqwlUlNUTlDuwRTq
 6kKiHj5+r18bZFYj3BlS7e1b53rIp12u4ZERwhqHdvYv1LTTPOWhQ/5YGzgIsNUiR+OWHbKvLQn
 Jn3CRyUHHS5SFYR51XvTVz7Bzl7f2mNCkwDbbdsGVQQ9MT0TDYQ59x0FHzsBVjeHWJ0jM9gBOIy
 kRxpXQsoIy8LXeib6I23b/A5KKXEJMTBvaTwhidrhDstTHRYGxCCVq1PSDfEHFbATXUqZuTXVaC
 zkBgSpLq/BGGgKOuogZ3VBiAUJHzuFYVHAFkp8x5Khwb2yYYKD4EzcRUJqkfQNzBIKSQgGhzDlB
 TQmQOLQIB1i+Ge0Ogbax47/e+iPvzbRiYtoQHhb7wSCswGk2L+afRKHP43vsA==
X-Received: by 2002:a17:902:ce03:b0:2ae:5b52:3818 with SMTP id
 d9443c01a7336-2ae6a9deb2amr60551085ad.8.1772715711782; 
 Thu, 05 Mar 2026 05:01:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae54136b28sm115696425ad.73.2026.03.05.05.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 05:01:50 -0800 (PST)
Date: Thu, 5 Mar 2026 22:01:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, Joe Perches <joe@perches.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305130149.GA1659133@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
 <20260305122957.GA1652563@rocinante>
 <20260305123956.ojkt4k3ly64xz7fu@skbuf>
 <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aal6kWDx_3XRGB4K@shell.armlinux.org.uk>
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
X-Rspamd-Queue-Id: ECE98212498
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:vladimir.oltean@nxp.com,m:joe@perches.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kw@linux.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[kw@linux.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hello,

> > > For content match, it could also be:
> > > 
> > >   K:    phy
> > > 
> > > I believe this would match everything of interest?
> > 
> > Yeah, and way more. Think USB PHY, network PHY, etc. Don't want to drown
> > the linux-phy mailing list in unrelated patches, either.
> 
> Also phylink, any memory management / DMA stuff that happens to mention
> "physical", and probably numerous other examples.

Makes sense!  Sorry for the commotion here, then. :)

	Krzysztof
