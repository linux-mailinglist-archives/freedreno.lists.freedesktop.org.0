Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D51A1BBE4
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2025 19:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876E610E9FA;
	Fri, 24 Jan 2025 18:07:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gi4zLYL+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0944510E9FA
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 18:07:54 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-e3a26de697fso3645812276.3
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 10:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737742073; x=1738346873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfjAH6wacEymYVBFOh1WPmz3PQJf2rhJKR5AERmsJw4=;
 b=gi4zLYL+aHnQjXPMpCUBzkzIhNRREWsfOHGwsMb6FNmvFs7pW9Uqr2FAr+/eowan0I
 mpo0hPvRhcT2WOmyp4IHAVPUUb1MPHQsKkMJL9s9Dzk1jtssOY9UyTDJVZHH21dmpY42
 V5hKQBLuAObEyeQdbtwPMp2TurVM9Qo0DUSctzwzwXAR4o/qXFnOK5vt0y/F3Y+/DoNV
 p5kG6Jqi/2fSDE8f62FrD8qe+9J5LHm8nlKxfcyvEKgKK5yhjcZFhlQps9VcalZaZjrL
 gCSuqumCAb1MeAIft5RwJvlnz8b1BopPb4aIbsjmezoNzR0Z9A6DoLCMkRy4qVVyxGzP
 yWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737742073; x=1738346873;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfjAH6wacEymYVBFOh1WPmz3PQJf2rhJKR5AERmsJw4=;
 b=Ysll14jBftjvVBfvAQt2aGBU8iiD7yYqrPTEqy7OciQxVjzF0MapY7kGX0LnJ39CeS
 Jelyf58g5ge1BwaEoACboMF+4+AMlG0+nutzqMFTJCNsaBsOfISwdXGzYL7eYaWkxfqm
 uOYUJNYqj0PosYlXZO2VLvEw59Rwi7ETDennQYx+ZcB2tE1E0B+mCvMGcJtia7vTEbcD
 WNOngqjTP7lPsE0O8o/qdihft5y0RtVq9EWCkBNe91KMlVubZcOxyPIq4gb9z1CVQ7vx
 ug307DvOon2LckvNXM4bMSNKA3J2MQ9DQxOOD2xFvhec20Ie+mObNN/yL7lcjUXuz5kA
 dKZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN/WMl6i5bLI74T291qoh5YdZ3wz7AjSaDyq7dPI2IUkyQgvlHby34m6AZBWEXs2YE7VsG/O2QZ6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzatmE8mVr6pIEfi3kwiJaUZRWV728X3YSDixz+oho8Zmm+exs4
 nrUNHNwjiVicOizZWR6+r8F5DWMfZndfMH8SZJ0xqZi9Iz120EEjm5B7v6WZOd8HHzLReIN6Vjn
 1AzEMfNZ3I3Tk01P2qwy0GhYPgzs66dBfW15jlw==
X-Gm-Gg: ASbGncvcP7y+vehAbicL1fqKPhUq519S3o4QmoAlfsbSmZDwzCxXBw5iio87SBciXyc
 Ekzmx3CbVW7Lqnd+D6FKhy8FL+b2E9yqJK8wSvHsg4/Vl/QgA4iKjIHSai3SvZeuDqdg=
X-Google-Smtp-Source: AGHT+IEvQawWvbODqKpeWmhbnVvP67aPuBS2qojQLo5WrCMABiRRxMrK1zubuPh/r6/xhtarnZgUkKZJY0JBR3HK9zI=
X-Received: by 2002:a05:690c:74c7:b0:6ea:5da9:34cc with SMTP id
 00721157ae682-6f6eb64e5c2mr240082137b3.7.1737742072993; Fri, 24 Jan 2025
 10:07:52 -0800 (PST)
MIME-Version: 1.0
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
 <fbe9381b-7a61-417c-af97-ff5b8f498673@quicinc.com>
In-Reply-To: <fbe9381b-7a61-417c-af97-ff5b8f498673@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 24 Jan 2025 10:07:42 -0800
X-Gm-Features: AWEUYZljn2d60ZQAEgu4wX7E2q0L-hbvtZG9qjDwTq_2iWq5aX5k6JqtUqYgnO8
Message-ID: <CABymUCP2dWK44j8n2ncVGLvLPoOKzgKK1NitRN-y8izpvUs__Q@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B41=E6=9C=882=
3=E6=97=A5=E5=91=A8=E5=9B=9B 15:32=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 1/17/2025 8:00 AM, Jun Nie wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
>
> Hi Jun,
>
> Please add me to the CC list of all future patchsets/revisions.
>
> Thanks,
>
> Jessica Zhang

Sure.

Regards,
Jun
