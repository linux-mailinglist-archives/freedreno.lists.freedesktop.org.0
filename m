Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D092A13C08
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 15:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA0310E983;
	Thu, 16 Jan 2025 14:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="smpJYcZs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336A410E983
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 14:22:19 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e3978c00a5aso1588261276.1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 06:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737037338; x=1737642138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CbuGDZY9OMcPNxDGGBghCFG72kiSYqjW874tNYrUfyE=;
 b=smpJYcZsKbSuyn8aWf0Rm1on+tpiMP6soapjBW65GKbZI9tm96R8o5m6Fsv/1BkunI
 ZgD6uzwFckAUzWcJckuXHExgZbaLxVz47H9Vt4aW4b8sGQJg66HdNyvCXySV22D1m5Oa
 6qHI6z/cP5Xi4+DE/As/ZGaGK7R1pvL9PxzGh+ii1gMK+lYuBpZCauWJ+EgggLgBOwRA
 rL8VSzBm9sSXl+jDEYt1+J0nJiXV1EBenCxbS/1dsuy8V7BXp8sjIxMD45jD99zgaMMn
 5Fpggo/4bFHPwU+qPhlFEpLjHHB7zCLxl+HpXX8/UrgpM7CHS+8REbWXvWtZsqwvbf04
 KYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737037338; x=1737642138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CbuGDZY9OMcPNxDGGBghCFG72kiSYqjW874tNYrUfyE=;
 b=lXnUMWJhQ3YbNeMTsW4H75lMrqDblUijE18BW/rExWDXJ/as/u4pnvjO+PaLP1uLgx
 nI6On1G/G+Y5yB5scUVX5rZ8fXJS2AYzF9CFGHN9mdgrH3xUUShyEjoTh7ic5AO79KKI
 m8gZZPOe2O5dl5in9cBJ7K51hditnUgyfdyqMoOOlL9y86kjwk41SOB6QjV0XwucfSq8
 5eHnCxR8vGF7QAWf6iXwpMQ8ySNYneNNevgB6NrcMHeQFCzGEIWboUDGfoSYQ7kuARgU
 zEld8oHMs4BNeU0ply3IiH0jcSUHOr4QTVryTiSqVR1pY7qLcaQGSmCoWflfZ3MIF6aV
 khGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5FVFDN3NSWYmsm8mdg4Onw5RVj5sTEFgomjJgfXXyFJw04cV+XCPbG5IBrPnmZjyLMUbT9xYLWHU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKX5e4Ee/WagJwemwSDfbkvNS+4crBcWu943lL6aSpgB0M2+LL
 GyZ8SyhA75vr4xA1ywsa7pH32MwQc1l/wUxLfyYe3tpQNeClIb87u/HwFFtgF7ef2iPg8mmRj/e
 Ez9vGR08o5bMbO7fWcqinhLn21kHo+Wtftypuew==
X-Gm-Gg: ASbGncu/8jR3kPJzZPagysRJ9ZKqf1Uy1iiGXVUnulX5zGVtJwSh9j/QQQhbJB7NKXk
 N7hotwSU11udax0QAJIS4ySIVjL1v5h3WmMP2Pg==
X-Google-Smtp-Source: AGHT+IHpVHqUtQvPALKWxgEbVerYIcWLhBHU/N9iKLPyTQmVZmgA6sC1QD/jrIZf+QH/2MqpX2ZsNueHigREXGRNnaY=
X-Received: by 2002:a05:6902:2e0e:b0:e56:c350:5977 with SMTP id
 3f1490d57ef6-e56c350607emr18592868276.49.1737037338327; Thu, 16 Jan 2025
 06:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
 <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
In-Reply-To: <kqrea3es5bwyofk3p3l26wj2iswvfqadwehusfpj4mssgawdos@wombtx67llyc>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 22:22:07 +0800
X-Gm-Features: AbW1kvbNYMvnvklmfvw1tMEdJlgZxWihb_2YnyoIX0fWNnPoBLq0Dgu08ZgKo4I
Message-ID: <CABymUCPn=u8jr_OTFwB-WBjj2nNgBeTyH5b=PvF5vLrDhCxr3Q@mail.gmail.com>
Subject: Re: [PATCH v4 14/16] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 03:26:03PM +0800, Jun Nie wrote:
> > Support SSPP assignment for quad-pipe case with unified method.
> > The first 2 pipes can share a set of mixer config and enable
> > multi-rect mode if condition is met. It is also the case for
> > the later 2 pipes.
>
> Missing problem description.

Is this OK?
    SSPP are assigned for 2 pipes at most with current implementation,
    while 4 pipes are required in quad-pipe usage case with involving
    configuration of 2 stages. Assign SSPPs for pipes of a stage in a
    loop with unified method. The first 2 pipes can shar a set of mixer
    config and enable multi-rect mode if condition is met. It is also the
    case for the later 2 pipes.

>
> Also, shouldn't this patch come before the previous one?
>
Yeah, it is reasonable to prepare the assignment capability, then
enable the plane splitting into 4 pipes. It does not hurt actually
because quad-pipe is not enabled in data structure side.
Will reverse the sequence in next version anyway.

Jun
