Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAkqKku3o2mLKgUAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sun, 01 Mar 2026 04:49:31 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F261CE72F
	for <lists+freedreno@lfdr.de>; Sun, 01 Mar 2026 04:49:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FE110E1EA;
	Sun,  1 Mar 2026 03:49:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RKxSHDam";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC2310E144
 for <freedreno@lists.freedesktop.org>; Sun,  1 Mar 2026 03:49:28 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-94dd06a96easo2332173241.2
 for <freedreno@lists.freedesktop.org>; Sat, 28 Feb 2026 19:49:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772336967; cv=none;
 d=google.com; s=arc-20240605;
 b=BnkxGJnx13FjqP52iNGw6fiv8N2bWhz0an3+WBN4jWlDRzcFnjQpZE0BE9LkhoZXOp
 QJETgbqE38655Kc7WDAVXeOntDywHjvH7XTPF9gnx+u92GxpgEx0OxItKUR+sc2+JF+F
 r//AP3DQN2DlztdwgUnHRbR6Udkkd3ZS0N6+Abm5EXjccDC9UGj2VBhsK1wmvs+tPh1/
 9kCO+G1LfFyt9qKwyngzEiwdvv8+VRb7TgbcY0vLSgIG+W09xWUcsjAdlVG4xTaIL+m2
 nYb7Mdp9daYL4b33evT8WuGMrSfIyUKRbjaWQ7EMi1JiIztBEAidBwkLfdgwLV6M2Tpx
 xzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4lnU1mLxbjn2+cl02vzRP4sy51RqCquCiXAgj5a19P8=;
 fh=AJ+T2it4VKktYmxxRT8kQH9Pp33czMF1xQJLbfHdgZs=;
 b=D2CRD2J2+7s3nBbPm/Yk+eLgAMTf7SoRQOrxlfjbLBSvtyI14+3HHJSomPVOfE51t5
 SfbYtZGOi8uIQjgi67tjg7JDJkIEvAIJDVVa3pVLI7M6B/wHkV8wigKkRKC7V/WgQMWX
 JoHd+Wgof3Bh++7pHy8pZ20BiuGgqvA7zQg9vAbVwqbDI56DCqdq45mcUFH0l3rV4Do8
 uJ1suU0QalOMNfq1Xb08gVamHBx+lTZX8K9S/Uu8sn1H+cwOujbVMqecO22Pv6mGCUJQ
 ZeuDo/yIqabflkVkQwxI1rjDfxtRz1r1Ue0a++I+JytCBgFv7W/5Gu26GczcmaSCYEaz
 AJGw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772336967; x=1772941767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4lnU1mLxbjn2+cl02vzRP4sy51RqCquCiXAgj5a19P8=;
 b=RKxSHDamgNNUVJgOYDCuD0ygdwbbSEDEDz/FLyAKyM/nucfHsj8npNviN6ScH4A8+b
 fvYD2IbqSy3vTgfDIo6LEYItoDzxzl4Mjc75ja1w0K0C/bY27qJib7d6qop1DMWnKluj
 piA/s/4pgVhQ4Lm63VQGXzkuVeGNjNaKtoLYEA0LVHuYf8eg1M7euiv6oDA5S7c2FuWk
 2dDyVfj5IxyvGneN4pil1JNBHP02qiMWFOfdhs9UMaOSmgv+7dLAwsyOEgP+G+K2Zfj1
 k90b8OSNYPWl4zoFKYDC5Noula8AR5D0+64uAwjEZPq9+PIbG0PMFk29qWrXPtT3DyEA
 5M3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772336967; x=1772941767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4lnU1mLxbjn2+cl02vzRP4sy51RqCquCiXAgj5a19P8=;
 b=vXvbUuQ30RXhrY+wS3kmO0TI9IZ08x6PYmIzFcEnkR3HIgqVSyTVUy6B2IszWTCf3x
 P6MAQ5033hSm/NgJwvMct4NcOXE1oO4SeNlUyCevnG1xdMWwLxdeeEnQB5/1TEtJ5JXT
 /bFi9Y1FA82Guj5hVpkFIgeSc5vyeeh0EwoNGlGaEKVEtsIX0M5VCeJ3fyM8+ClSy6yy
 PGaPbfYt9zkUhYqvydZji1JUThi+RbNk2B49UoGMJuNC4qTZAptoEo8QQEoDxnKFMdNe
 6K5Kqn1loEklR4u8qH7/h6ErosZpaPxSUHi9W2Ps2QCTmHZ9/uzAYTASFHOL1ZtDN3/3
 ONjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgVLqqkZEtFSQcaEyYkdmdrRUufr74krk3rsgY5T+kskFs42kf/Lrh95Se+o6fmck1v/OsSYPAAdk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuI/bf846NfA4uRnoN0sZfoKrCEHk9mYsEn7K141et8KTVUmUZ
 x28lbnvuG/z3hrA/JAb8popTMCwjn6F++jsxTEQODdXIE3dqJG71G5iFuM8E5x3JSO+Or/X4TvF
 x1BYj2gJrmwzAga+t5tlo5kaBpH1Mw1I=
X-Gm-Gg: ATEYQzzP5IUL4oJpbDAnInTfMefznBXciCyzSkj+Iav0kxCQcmY1t2Er88l3e92Bm6y
 Ep57xi+K2I1aZooYRBs3RtKVw2woVp7yjM9y5OvTVkLy3IAIqgkamqamFDf6LHdMVaDSZlglmVV
 GkTU4pcBIVZsivcrAc7Pl0jpPhUmBgsL7KbIvvbi0dpgjAlq2+zls4AW6iHG/oHb6q+XQgjrXtw
 NWrb1HHllwvvQj6MuPm+0Ivhj7ZvdHVxKho1E0l5zNnMcKx8Bx6T8hRumg/WjFNRvaJlNkxYwsY
 CxuU61Y=
X-Received: by 2002:a05:6102:3ec7:b0:5ef:8ae:85a5 with SMTP id
 ada2fe7eead31-5ff32324fa6mr4498357137.16.1772336967571; Sat, 28 Feb 2026
 19:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20260228101907.18043-1-mitltlatltl@gmail.com>
 <20260228101907.18043-5-mitltlatltl@gmail.com>
 <hfohv2evihmqbaehmnjsj2cgmqbjytsa2j2z6l3cph2jlszv3t@d4c32rfdvt6d>
 <CAH2e8h5J7FdP41JBgEC7aUPk4AGwNnZ83+dYV0=n=7+PNeMVng@mail.gmail.com>
 <sb54l554woevgaetb54zwyn6fdrz4bqi7vnsavdy4czqzbcwjn@qf5wckbfzt2z>
In-Reply-To: <sb54l554woevgaetb54zwyn6fdrz4bqi7vnsavdy4czqzbcwjn@qf5wckbfzt2z>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 1 Mar 2026 11:49:10 +0800
X-Gm-Features: AaiRm53oZLI3cEOC6H1iwG89lbfTLYxPepZoGTGf8tU72v7-R0PVDG9WPFt8CG4
Message-ID: <CAH2e8h48wG92D20Mq8P=8qcur1FWTvwU4R5PEN3LRNE+D1es-w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:quic_mkrishn@quicinc.com,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:gty0622@gmail.com,m:liu224806@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 08F261CE72F
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 10:23=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Feb 28, 2026 at 09:57:19PM +0800, Pengyu Luo wrote:
> > On Sat, Feb 28, 2026 at 9:32=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, Feb 28, 2026 at 06:19:07PM +0800, Pengyu Luo wrote:
> > > > The DT configuration follows other Samsung 5nm-based Qualcomm SOCs,
> > > > utilizing the same register layouts and clock structures.
> > > >
> > > > However, DSI won't work properly for now until we submit dispcc fix=
es.
> > > > And some DSC enabled panels require DPU timing calculation fixes to=
o.
> > > > (hdisplay / width timing round errors cause the fifo error)
> > >
> > > - Please squash refgen patch into this one.
> >
> > Ack
> >
> > > - Please post at least the dispcc fixes.
> > >
> >
> > Yes, it will come later with the panel driver. Lewis provided the
> > patch but it was generated by Claude AI. The patch itself is not
> > complicated, it only removes CLK_SET_RATE_PARENT from
> > byte_div_clk_src dividers. But I need to find some time to analyze the
> > dsi phy clock diagram and reword the commit log.
>
> Krzysztof wrote a perfect description in the commit  b8501febdc51 ("clk:
> qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf
> parent").
>

Thanks, that is very helpful. It's indeed the same problem.I'll post
it in the next two or three days.

Best wishes,
Pengyu
