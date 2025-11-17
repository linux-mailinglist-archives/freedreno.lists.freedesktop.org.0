Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D30FC64ED9
	for <lists+freedreno@lfdr.de>; Mon, 17 Nov 2025 16:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F0910E3D8;
	Mon, 17 Nov 2025 15:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aylnC28c";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01BC010E388
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 15:44:17 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-4336f492d75so22935655ab.1
 for <freedreno@lists.freedesktop.org>; Mon, 17 Nov 2025 07:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763394257; x=1763999057; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=;
 b=aylnC28cv2IZa4wC6pv6RnOKQ9gp9WxSnfOPdQLePytDmw4woc+IQzdGmXIyQfReHH
 Sz4xYhbbpRoHiIfor4IM+4maC5ufHUTfgvKDDUfzlLzz5lP0URezvDFZ2HYEnsU1oDeq
 EEi7wcOgk+84rfTxVrGyHqMm1hL+2L91Vpv4NDGUCLr6qKKo3D5fc3KAMCwoqB3y0/1K
 ErVsoRy6cS2n/Ome/HSKk0r7agr3qsWytALHgMph/KQTu6Y1y7jStBK11VY97g2vpb++
 uadtaxMCLVfL9Ri8ztkG8KS9cydvsmrVKLQSPLNRSJdrtwxkxy2e/hQ9DHabcTTzyrvg
 FcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763394257; x=1763999057;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GakGLx3BRYbnpcXKQqj2rxUbKKiFxYQ8pO9cOSBXY70=;
 b=NnC6hK4ttE35e1WwCLRz6RVN5+ijWUzxjnmAn6PW2BvvRsOnqmDK6o5vX4UIBy70uW
 cWd6nJhNtUMm+7fUnjmqUyh9Q4dm4gzYQCsRdIw3QvOqMmKwaq5DhqPlAhTHPiUh472s
 hxeygO8wnifaddpwRirld5Qj4P3xDkTX6NdllmlgD20wl9HSpNPbUzkmg2GH9gBVlKzc
 VAPkrJieq2pq4lauBOLkQpb3E2p3YlrsPHHQeq1ba1hy633BkXFa0dRXehHhb3MpslzE
 nU+vrnBgUY79gxOcBKosITJ24tLJhAIMAMSt8PgPbapdKrPsXMcKcPlXdXYV69GB49Ob
 nUgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjKSlpOn17F7BYYVFT8U/1GfUKmwkZXQtsFTLKnxTtHULETCX+wdfLel7Do5EAxEZlLWU8fTlolNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2lweRFMZsAQYxwFzW7sTdTSrCfqV1fQlkZaEZSKlYoEwsdKJZ
 KNOQNvUgJ5BP3oT+j7nwZupZ6et2AarAfXtvqP2nQi8VIB8y6FJdQ/0sTrb4m4xkmDlpOryYORj
 weubla5qCwuNIyS7xfVKGPVf0UtSoMi4=
X-Gm-Gg: ASbGnctrlcrGBR8VTAh53aJWfVzpoDq1JpLMo68of0mAQFvm2v4OniQEA+Xv1RT9mx2
 FJ2yEESvKvXFeJt1K8NsOTVm/a80my9Te/ly9fbsIikuP2qZf/TE4lH1ymjEWjNKdIFd81jSET8
 bd1bIfQUFqoDPSYt6XMNt2wkly7ejWbFl+rLzqUPu6t36YmofVPCEfDlH4nWJn3wx+3NDgkpgH/
 sq0xStt5altLC5ePjW7x43zLeyQID8umWcGWS6Yc8+kaMzZ3aSUCep16HYHiCrqWuhlOQU=
X-Google-Smtp-Source: AGHT+IFbdBdmra1r1MTAuYm3h2YFina8VK1yyiL7rlrlzpAiB2tUYzJNKmJeOBR2QgET/eNSGZvdZJ+H1CdvND+9bDs=
X-Received: by 2002:a05:6e02:1808:b0:434:74a6:48f1 with SMTP id
 e9e14a558f8ab-4348c94f0b1mr136903685ab.27.1763394257015; Mon, 17 Nov 2025
 07:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
 <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
 <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
In-Reply-To: <ff634b09-c28c-47d0-a57f-6203755cedb6@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Nov 2025 07:44:05 -0800
X-Gm-Features: AWmQ_bmyUIznEYyCXfUeRMdsertmn-wYkkRaXSqTVS6sR8e15JC5caO5D32ua0k
Message-ID: <CAF6AEGv9OVHBDF+XVNRr+ZtWijs+MDNUgw9zg0HbebuCQbHcZg@mail.gmail.com>
Subject: Re: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>,
 linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Clark <rob.clark@oss.qualcomm.com>
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

On Mon, Nov 17, 2025 at 6:00=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 11/14/25 12:29 AM, Akhil P Oommen wrote:
> > Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
> > architectures. So skip dumping them during recovery.
> >
> > Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
> > Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> > ---
>
> Looks like this changed in:
>
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/95104707f189b2e1b06c855=
b563c1203b33da354

Crashdec finding estimated hang location based on CP registers dates
back prior to importing that code into mesa ~5yrs ago, fwiw.. and was
improved over the years to better handle IB prefetch since then.
Fwiw.

It does mean for gen8 we are going to need a CPU based fallback to
crashdumper to make smmu fault devcoredumps useful (since now
crashdumper is needed to capture CP regs), but we need that anyways.

BR,
-R

> and needs_seqno is never true now?
>
> Konrad
