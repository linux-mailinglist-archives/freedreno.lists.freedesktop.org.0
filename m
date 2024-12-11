Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 819489EDA6B
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B10889D9A;
	Wed, 11 Dec 2024 22:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Go1ZjYYA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C3589D9A
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:53:51 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6d8f916b40bso64202656d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733957630; x=1734562430;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=2egq6Dq3KjRKLgPQmABDsLel2na1tngRhhj74d6j2rc=;
 b=Go1ZjYYAShTbRVaDlXCnKuyjRNO8eJFruMVNNc0hwn5FcFStmIq/xqt3jHcTxWbQGl
 PGXxerg1FhovIhi2ri/h1HIJP9COewGtleQND3OAz0XwfkHQA/DVGqEJWgPkeZPkl8tb
 lFmO055bD2q5JwQxZpQck/fPq/Ci75zw4dFgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733957630; x=1734562430;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2egq6Dq3KjRKLgPQmABDsLel2na1tngRhhj74d6j2rc=;
 b=aXcbmuyE7+0VY29EJp3ftc0sE4IgjsbzmZmbfnhf9MXPE/mndkRnZm26CLCniID3g1
 o19ruxCLU/5iZ9mYR8i6JEZHDwJdy+2Ll+QNBhTu6DXJhUMR1mZ/HdNWkknh0zRvPNc+
 P8Z7nQEG4YulM1iwY1DQ4MZWMCec3Pgh14rqSUe7TyJ+gBLc89yRGAZG8rCkg6KIZQAC
 fTQ50e6loqop/Cc8gu1tY3Nk7YpmLCkyoJJ4nSR5TospmNsOygKfWs3Fs8E+ILvg6bHS
 myQvtXW06WJmR7MiWP4ZaQA+199+yCfecYORijJ7q3QGTIF34xwoqR3fh3+uTnP9fVZ2
 S0+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrV//1f68pWXn0jP3/n0jh1B9lYkkgfNrMUK3eZlAYa6oFVmUAInpD4W8Gag6mbMmOCw7ri3lBjDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/IOv6jCcRcOj7HOucAJR8yDSZ3NQEdkc77kin7Q2C3MDwCAE4
 eZnpU8X8EgK23FlJzYFnDrgbgeHbKsZMKWbaXW7hABJVRJesxJq5fabXN634MCWdZWF+FxH3Y4n
 KmOw/0Sl5FIvekY72qNKdrJC5fDQp9qOB9t9u
X-Gm-Gg: ASbGncvL+UxYGu33ZBbESRzvFRiqxElXgemBqQ53pCQCKwOUTuv+crWfPJ3jLcZ/Qx2
 ESKYS0pIKHmvwGhf3qVwS53xMc9JwXYlKfNfoQQEIQgKr8xWajDYZnyRg9chrjCk=
X-Google-Smtp-Source: AGHT+IHPYfu5RWwg4QjV5Ft9MAhO7VJZB9xFWbSMLRysOqfixDFuOnt9+09RHZcOWbxPXE1q+wf1OmiIJ0aIfFFsbn0=
X-Received: by 2002:a05:6214:1d0e:b0:6d8:aa45:a8a2 with SMTP id
 6a1803df08f44-6dae38f441emr17981836d6.11.1733957630566; Wed, 11 Dec 2024
 14:53:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:53:50 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-13-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-13-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:53:50 -0800
Message-ID: <CAE-0n52NEHh6XnsWsg4XG0nS8cVpC-HW8snBLD86PO3-AV3jfg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] drm/msm/dp: drop struct msm_dp_panel_in
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:43)
> All other submodules pass arguments directly. Drop struct
> msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
> all data to msm_dp_panel_get() directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
