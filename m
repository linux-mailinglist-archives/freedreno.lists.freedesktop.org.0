Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGXyOSw1oGkqgwQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 12:57:32 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA51A56ED
	for <lists+freedreno@lfdr.de>; Thu, 26 Feb 2026 12:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A209C10E06F;
	Thu, 26 Feb 2026 11:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kHVZ6FtY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D22210E06F
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 11:57:30 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-5ff196450c6so151037137.2
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 03:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772107049; cv=none;
 d=google.com; s=arc-20240605;
 b=eBHQMFc2vbRBzQ2Z535M9cshDhm0rtI3IT6syG76ZjZN9L7v7iWm1H3lavtMNlzRAc
 Wz3peRrX7MAwcqmVglYK9pp99GLKgyIlcQ/ktPYTK+LYl/Wj/t934Vz5aU2wRMHYT8Hd
 MM6mcGkZAu8bfmQcLa25BjLqB6aqkk5CpMo5Vv3aROVONvVv/ZN9A0a+1JU/9LpIvmKW
 yVpYhcm9f/cEQZLYmnT8/dTOPOHlgAlIce1VpoxW7h9D3eJySOOCMoencEn4k0gdUrp6
 X6A4QZvBW5Xr91TM4gnlIhXUbooViqmYv+Y93GlxXy30HImGWRLtRjTZ3qSgl/Bdr5Oq
 kAjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=qNtK32BGt9MxWXtwDTu0yUUapwxqATE2188PlWft/QU=;
 fh=uYxnaaqu9yI/K63J7LJh5kJCtl1ie9Bcns2/S4rVXhw=;
 b=lztixu83m10g0c292pDWm/Eed7oxRzTDSgPp7FoLGx8slvBfua5FAKjPjwe8EwdG4e
 QEt3ZmLosFA0aKjRua/+MW13eaGSeJo+5Dxy0Xbxu9rVeVdN45nPXIOtLXCfcU0hUuD8
 sgWxqAc/2AZf0/mIQvjGO0Op2YNCicSLiYlFLTGWYtGaqRlOtaF1k4mXCUmLyvLL3t60
 Ptk5hAETk87el2Ppgjvjc7MhEFSDEuLpgNGkQhIeCgsKC8P9RA9RRxYADgsRidhfO20X
 1zfxtvd9N5LRifxkCS1aHacmazE16XQVazT1tCafXRyB+tWW9R2hWfSDdN30yJqFcH+E
 KMGA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772107049; x=1772711849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qNtK32BGt9MxWXtwDTu0yUUapwxqATE2188PlWft/QU=;
 b=kHVZ6FtYjrWgQGG8gThgqCXrB3WGPlMcf4Bo5AGP485gcMAdEHSQWec3kp9klRH9+G
 eYBZ0gr8Px8NiyXaUGvQk0k/4YfQAbPD8hQcBye9HYNdJ+1X6Afbqmmp8Ct8dwLw1CZ9
 RoAu8tfFrzvmOijuW9mMkrdzUYFv3h5R4EB95zZtHaLGtrfKe7C+Wwj8Zgy540ZOyJil
 MUoQReVQZj2ifEDHJKfhYP7n1JyrY9tGQ7UYwVBwZ3CzuCeXNY+MRD6mNpD4CxjX1iIG
 nR2C5IfhomBsA1OEbN1iIid96brmJNKw2xvQmjqnEgQlByf/wY11kNR02JMzLcD9i53I
 ysaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772107049; x=1772711849;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qNtK32BGt9MxWXtwDTu0yUUapwxqATE2188PlWft/QU=;
 b=pdQ2QpEXulc81SgrDgIs9UJ0HCodCm8D/mTtcoYQEzgjJMeZ/vyegawpsCyNLWiA8h
 4qRjiXukjnJvaL+aGfho7r52dlH8RqpL27HjwlBEMIDadITbHerG+1F/NwmidvM5Sk7j
 cTMkaPs0Rwo60f917RQu+nliSAuOoOj9/r02zAFYg20Uf2ZhhNGcv3NdYHew1TGqDX2I
 szRqWa839tjP+15YUcq72AKzc/XBLNaLjfE6gF8Efj5Lu7qUNx5N3EwV+D9MYpY/DpVr
 0dgzn9hiT4saGLrKutJt2k1xhbX5pUIM3/tEapaTH3D73lkXXrOVMOv/SjL/E8euO5zh
 5ngw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb4KmmKQmgfX6axhMG2pNiepOYdNTXyiFO8G+QxGdfr4t+q58N20O9u96o8xXJdJ8vBKUx7aVPsyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0Ra0tT/A73STu1PnzFFWwyNq3RkBsz+Hpy77WyPvsKpnwPLM9
 Yk1oBF0gAtiXx6jVjVmwcbWbYJaIWjSYT2xb4mMzTA4/+0U7hQX0VMcV23pZhiVg/c/Lo2SwDI0
 HWyXNwM89YTmRM+UPFdpW6eSlX6Nnsso=
X-Gm-Gg: ATEYQzwoj3dytMoyexH8TGyaItS6NLoVF71fJN5K3OMN0o22MLt2iBpl+XtSoyUbi3t
 eF32vlNLO8gHeMqxTjKHY6Up++J01uCkokZcpuqTZ7QGYCYZaQetFNPU1+IHtacIrokQwLTVVI/
 rle7U9oM3bRyzlZOJTJrBR8hV/tX3Fl3kyLJpMS/HFFN4Udgi+xes6EWgQ0KcbtStAblCMI3DzN
 0IIMbLnjwyxJohbbsYTWjmWc27Nix9Z5diZbKJtSPRlDQKlD7QG5up004enFuCh7oCNpYQk6CO1
 Vxrh9C0=
X-Received: by 2002:a05:6102:c8f:b0:5f5:3c38:c4bc with SMTP id
 ada2fe7eead31-5ff140aac98mr1601764137.23.1772107048800; Thu, 26 Feb 2026
 03:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20260225054525.6803-1-mitltlatltl@gmail.com>
 <20260225054525.6803-2-mitltlatltl@gmail.com>
 <20260225-analytic-economic-parrot-4c3a45@quoll>
 <5617b6ec-b1f7-4f3d-abda-d7142c323759@oss.qualcomm.com>
 <CAH2e8h7T3Qy1f=-34SK+q=n9TRYOtzyxY8R6yKZJZGr_f+UMZg@mail.gmail.com>
 <rwsaypiovv3xtw5pfxw5rksmqetv4mogu4yy7yrm7gfknezmuw@bh6v5q2zeuiy>
In-Reply-To: <rwsaypiovv3xtw5pfxw5rksmqetv4mogu4yy7yrm7gfknezmuw@bh6v5q2zeuiy>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Thu, 26 Feb 2026 19:57:12 +0800
X-Gm-Features: AaiRm50VYYJa11U6YREQitoe6H7Afdc4A9v2yu5-PwbhgzvuP2StWI1hICwfKV4
Message-ID: <CAH2e8h6HCBpMfuzE-e2sOvE0SF9w2bgci68mxENP9J7cExp1yA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: display: msm-dsi-phy-7nm: Add SC8280XP
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 35DA51A56ED
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 6:56=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Thu, Feb 26, 2026 at 06:44:02PM +0800, Pengyu Luo wrote:
> > On Wed, Feb 25, 2026 at 7:02=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >
> > > On 2/25/26 11:24 AM, Krzysztof Kozlowski wrote:
> > > > On Wed, Feb 25, 2026 at 01:45:21PM +0800, Pengyu Luo wrote:
> > > >> Document DSI PHY on SC8280XP Platform.
> > > >>
> > > >> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > >> ---
> > > >>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | =
1 +
> > > >>  1 file changed, 1 insertion(+)
> > > >>
> > > >> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy=
-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> > > >> index 9a9a6c4ab..9223af1f4 100644
> > > >> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.ya=
ml
> > > >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.ya=
ml
> > > >> @@ -23,6 +23,7 @@ properties:
> > > >>                - qcom,sa8775p-dsi-phy-5nm
> > > >>                - qcom,sar2130p-dsi-phy-5nm
> > > >>                - qcom,sc7280-dsi-phy-7nm
> > > >> +              - qcom,sc8280xp-dsi-phy-5nm
> > > >
> > > > Your other commit claims it is compatible with sa8775p, just like s=
ome
> > > > other devices here.
> > >
> > > If that helps, they do have the same values for the REVISION_ID regis=
ters
> > >
> >
> > Thanks for confirming this,I will add this to the commit message and
> > fallback to sa8775 then.
> >
> > I am curious, do the PHY QUIRKs in dsi_phy_7nm.c reflect PHY revision?
>
> Yes
>
> > I notice
> >             REG_DSI_7nm_PHY_CMN_REVISION_ID0       QUIRK
> > SM8250:     0x00000014                               4.1
> > SM8650:     0x00000025                               5.2
> > SC8280XP:   0x00000024                               4.2
> > SM8750:     0x00000027                               7.0(*)
> >
> > (*) SM8750 is 7.2 in the downstream.
>
> Please change SM8750 to 7.2 (and SM8150 to 4.0 FWIW).
>

ACK.

It is exactly 4.0.
https://github.com/OnePlusOSS/android_kernel_oneplus_sm8150/blob/oneplus/SM=
8150_P_9.0/arch/arm64/boot/dts/qcom/sm8150-sde.dtsi#L518

Best wishes,
Pengyu
