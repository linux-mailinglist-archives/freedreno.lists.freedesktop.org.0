Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM7QGlX0omlD8QQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 14:57:41 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9394E1C362A
	for <lists+freedreno@lfdr.de>; Sat, 28 Feb 2026 14:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B7610E2A2;
	Sat, 28 Feb 2026 13:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d0g4URW9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A4810E2A2
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 13:57:38 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id
 71dfb90a1353d-56a87d7c5d7so2487882e0c.3
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 05:57:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772287057; cv=none;
 d=google.com; s=arc-20240605;
 b=O09Nz5/w0s8QsX5As3DuGnrq+6dWsLFS/apWq0IKWz86CIp/GP44WW0UakfxTXJimV
 GCJwrlhN+qpncEgajaq2WEAHMvrXSkb1tY8oxbpc4qSUi1/cXjwTsLenYfmSZVOwX+lV
 cJB7d/+gK6LugC1m+q6u4fw31+3wL4RSgkH99iWgerLDZJKNSLufElwZ6zR88K8q2B6W
 i4PpnNO/SQ7VB6FnJWrMJEC/2WquCavq/7/xsQsUUP4iREXh/LyxVg9sB64OPe54Ynmu
 zHvRZYvyojszXOKSp1FUmqqblB1jwuJPLkeu6vKmlOF2Tg8E42FpM3O8QB7/XQU8h6JG
 NHkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
 fh=+ybTPjGyqjPK4wUJirwfQRcYd0GXZSGgc8c9mAulsdc=;
 b=dtLTfR31R7lhdRndXwOjbZLOl7OXeWdopjVI1kA8EXQclRMNM5UQ5IaFRtgtnmSQq0
 /avUE2BnwbZvK2jlyyrwqpaeWu08BM8zq8QnroFQ2pkrSMFsbVYE6Mbn4YMfzHKmXHib
 bqaWqTm6YlpoLRRDGs2X4SB+7yF8d0PfaQwExXV9JsxoUDBQJNLHBvORPdVmgzFVSL1V
 oDRGZZige1qVL050i3UcNWCiatjOMKBTOTTjQ92p9CKn3zB/myCFL9vgeXduWeAze/Ja
 NwGo1WxUv0Lrvyca9YiuWMK+fOcC1vZS/i5sTYfOsTc84KkCjanBgYfDzAp12iNXTv7i
 XlbQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772287057; x=1772891857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
 b=d0g4URW965sFhpQHej9xfrslUIo4YOvBkSdopJJtoW7aXIWGLEeoz5JHDPYd/3k7Gf
 a8QxgBC9Llxyx21w84+S/lz1hgSGCG3DON0md2TayfybnKyrTJms3XZVsjygW91P0zrc
 ZbxiyoIaEWtUMW9wMkTFYleC/eGsiZ2a3JUDGSl56iURBliYqu+Nl2v8VKyTg14x0P/b
 R4i+kCvkPxxbxOocFT1vqLJ8aWAHiqDDsXe3J+1CUYMgGX3AgzVjUh3Ks3f/VNbB/Rkh
 RBEz94eAcXPySX/asPkkCXsIrJtRIEWbuLnpGv6bdVYP7+eyKKBdTWsQ+ZdYR+mUkHg9
 DKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772287057; x=1772891857;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OHy+nPU0PfKOPSTzaYhzi7AqD2TPKVJAIyn6BXVRVv0=;
 b=sJBlV4Lc2wpwZxw9OQNk+Xg7a4dwJ5tKCquBWDrafnb7i7ipwAdDPNXMi0ihLDm4Li
 hWwa0p/SJtJm+EZg62pFl8JedJpDiTdjQlsdKyQLknveEUymlSxFqfHfyLrqqKtGpO0i
 cn9RhOxPJN/yEwyXzO97/CIFHWqMI+QSj5ZMY75P/4bs3eH/Je0krMGGcz0D2zhchCg+
 wSRrkZsK/rjpE+NOgk37e1Y0719FrE3ICVoXqW1MSL003ttHFzwatqfBjPgTX6/fCcwM
 cMr+4CkYjeuSNaZvYnsTUB0JnS8GIJFmwBdjU0+gbWcQv+GDq15qWrYJ5Pu6TSOLpLX3
 mjfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5shG8YX4WPP31h00dg3jIW9bA/s4eLe15eexpjpnmcDbakqOenjW4lR+xxXSfutMU0RFsR49EbpQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2hZyVFY8X4G7KakxOhuOdhl+jPkqobAJb9/JGfChk5wtjfRDB
 A3kbRUkZcWiab32055u/C2cGdj4GQETEpC8u0MkFzhBOOeYZrP2qYg4GSyOsA61wrHD1hgbABzg
 AZ/R48BtZCmI0bEw4bU9sfUb9JQHrvCY=
X-Gm-Gg: ATEYQzzq+hgWmkIF9Jlxv8eXH8O47twAHGlvzVNABSjSh0hUGIVPap54BYxseolcZj1
 i3vlQbR7FFMsUM3vMdTIzxd6bGRdMIu9wlWMEJfllneIYnxLg3EzjO0PuRmZHKgaA324IERrMOx
 83j0TndRGVou1a2UIBwVjgd7Iiyt/q+YOaxSefgwZ55bcwfbsttCLsY7BQ6USKI1t8/9CFhb4Qc
 U+khbP7USQtG5GCzajw9WCc8mVqai6jesMxcZhV2mRM6Xl/IB2leaYDfHbidufcQyeHfvQhgO/e
 my8tRM5eE0qA1hvDIA==
X-Received: by 2002:a05:6102:41ab:b0:5f1:606f:2a14 with SMTP id
 ada2fe7eead31-5ff3248d7f9mr3793793137.23.1772287056552; Sat, 28 Feb 2026
 05:57:36 -0800 (PST)
MIME-Version: 1.0
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
 <20260228101907.18043-5-mitltlatltl@gmail.com>
 <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
In-Reply-To: <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sat, 28 Feb 2026 21:57:19 +0800
X-Gm-Features: AaiRm528taAECdfaNz7MHnvxwd2NLIV6e5nb43M70lsJMEjqfm41ug7OY7NJn1E
Message-ID: <CAH2e8h5J7FdP41JBgEC7aUPk4AGwNnZ83+dYV0=n=7+PNeMVng@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tianyu Gao <gty0622@gmail.com>, 
 White Lewis <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 9394E1C362A
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 9:32=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 28, 2026 at 06:19:07PM +0800, Pengyu Luo wrote:
> > The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> > utilizing the same register layouts and clock structures.
> >
> > However, DSI won't work properly for now until we submit dispcc fixes.
> > And some DSC enabled panels require DPU timing calculation fixes too.
> > (hdisplay / width timing round errors cause the fifo error)
>
> - Please squash refgen patch into this one.

Ack

> - Please post at least the dispcc fixes.
>

Yes, it will come later with the panel driver. Lewis provided the
patch but it was generated by Claude AI. The patch itself is not
complicated, it only removes CLK_SET_RATE_PARENT from
byte_div_clk_src dividers. But I need to find some time to analyze the
dsi phy clock diagram and reword the commit log.

Best wishes,
Pengyu
