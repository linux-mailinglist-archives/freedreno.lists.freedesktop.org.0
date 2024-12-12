Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3AA9EFD6A
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 21:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784AB10EE94;
	Thu, 12 Dec 2024 20:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hwpGViZ8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E58710EE94
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 20:26:47 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6ef7640e484so10967467b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 12:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734035206; x=1734640006;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=SW5CnNui3R97mY2cLBPEbaMn7nNMtZlM3tT/CgKujL8=;
 b=hwpGViZ8TNHu7oXSnoL/qGLhChKfhO+pcVoCrGfwrRRYrsdRjoXGcQ/rNLJSBPCvD0
 ttVNM24+WahpmC4WwLNAX+CdQ6KepMD5dcJ5na/aF6oE5PueMdzokhJQrCvaxo2rg0bx
 PbdaBJoG3IGNDk25B1Qno0XUcA9ZXZimr87QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734035206; x=1734640006;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SW5CnNui3R97mY2cLBPEbaMn7nNMtZlM3tT/CgKujL8=;
 b=eOSDeeaDSMq2cPRSBwCIhqM7FOjqCiFZ1B6K6uqcLAiYo3D9RfYvYwGB5vJEMWo3Fp
 4jiATlWSifj5tS+AuOKimMbKBSvWt1u13dMrJ1ysesJ4DLv3g+82RHBQEhGds87eAZ5c
 PDfJMaU3r2iN38uPYJoDGEhSslFjw8pTTBM3HPPbH9kV/IvRbdQDoalkx1mdvn1UbEPe
 h5F8z7WFrJPfJZ13E/W4J5a1jw7V7EJoUip09Kz5A0zDvXW59s2OJKEnm+70oJWSJ6lk
 6uJyIq2UeamnoQ+VDQbUW40f3bMVGGM0EgYeleZE/E0k5It1RFV9IJJaucYLdFOgeicS
 ALog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUigl8cLlaxU7KTeI+1VNBnC7DACxp1YCwRo6e9Q2Vbh3pkFu1mxGLtvB/5eNYOyKbfwFkMJAY5vKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9MqdVbQi65LT6wBXxNxZi9zJW97oYsL+asG36dA1oybAQn5o8
 X06QytaXjxiEU0PtJQpWJuVaVfTEEc0IwjVxNpa7WiFZ/DkQSfUK+soJUQGrI6WUfcNggbH7o4w
 Zd6G6h0fldgkWY234qmDx9/bufsXws6tsKhw0
X-Gm-Gg: ASbGncvpVYAQb9Ji77NDBSBCLS5uM0KvfZakEW99BkHDsct+QQBSmiRZRmwgLctXlrC
 l2Iojsh7Py+/gHyz3Bg1nOJcjFQbwnT1cgvkPkuTUAQ8a0jVb5Is8+9Dj/Wo8e37b4w==
X-Google-Smtp-Source: AGHT+IGFOgDVm4CFDXe3IU7TrIeBHR0ltNsmIqxmA2AqNWpAHBHRWN40vh5Dhn/6yXzuo/xaxcnVD3/msC5W/xKQZns=
X-Received: by 2002:a05:6902:140f:b0:e39:598a:239f with SMTP id
 3f1490d57ef6-e434f945c4dmr88547276.49.1734035206765; Thu, 12 Dec 2024
 12:26:46 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Dec 2024 12:26:46 -0800
MIME-Version: 1.0
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-6-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-6-0b1c65e7dba3@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 12 Dec 2024 12:26:46 -0800
Message-ID: <CAE-0n52xCodsb94V2N5+ENsft81LvHrngTrcc=w+FSYmmXELHw@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] drm/msm/dp: move/inline AUX register functions
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

Quoting Dmitry Baryshkov (2024-12-11 15:41:41)
> Move all register-level functions to dp_aux.c, inlining one line
> wrappers during this process.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
