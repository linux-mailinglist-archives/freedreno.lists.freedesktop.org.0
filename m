Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A729394F851
	for <lists+freedreno@lfdr.de>; Mon, 12 Aug 2024 22:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C985610E06A;
	Mon, 12 Aug 2024 20:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="csqXt9Ay";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1DE10E064
 for <freedreno@lists.freedesktop.org>; Mon, 12 Aug 2024 20:40:39 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id
 ada2fe7eead31-4928e347ac5so1286126137.3
 for <freedreno@lists.freedesktop.org>; Mon, 12 Aug 2024 13:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1723495238; x=1724100038;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=NZAvXAR1bYBwYWxJuFfSjAliHSEQ1/ECvzqzNyw/0sw=;
 b=csqXt9AyJ8gWxIigIfbnsuCvEL/BotjVCHlR7PpMr8UF3D8SQJ4zg283bg6uTbTX2E
 tXt9UKqapKTnODFbg1UxmUuZ02aOQ4jiOCLt1021ADLwfCuBtvX9Z4RU4SXCUTjYNqO2
 J8Ky2uhhCKNdxp0gOyeSSM4rGxHqWBlrkma6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723495238; x=1724100038;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZAvXAR1bYBwYWxJuFfSjAliHSEQ1/ECvzqzNyw/0sw=;
 b=jUMT8YifBbG24VnGHpi+iF/XzioDh+mySDy0Gv2RlU49d6UuR1dMMZx5FW/JZlJ/i7
 fspqslPiVtyYHsqJUtM3nfON4rEPQq0U37h+fkyxRBPRiYgmw40C30PHyBHCTHzqL9+P
 iJco5UVWPyH0ezUMXVcI5BtsaVBb/EEO38Fa+M0vH/ydyJvgo7hCU9azLI5i+9GCYzlF
 o8Dm3SIZ6HuLjx+seWVv1yPAqAvUq6Pgmts7f240hI6thor+45xRndPkhDWSOOP8Mo3W
 v8aYpbYXEuW0qnXSSyUFEe59PpZes/ViN7gWGm9kU3IzgPN68yLx0lr/kPrX2P0qWxAf
 tlpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUT7FGd1bDFOqPW29+JM/Adfz8Ah1CfnMNVBOzu+0e3Ll9qms+QzHlGyxRXre+g0W6n9fjRT+yEpj79BreHo7XuJ2eNwqOUzoX1fQ5uEXqt
X-Gm-Message-State: AOJu0YxRV/daWr2qXMKFzfNPxPnlh+AwUm+vLae/BRUzP9NHFzWjDwih
 RX2UZuL2p4o0E47gyolWAuRLYrQia992p85nHhgDb+YaqE/+Um3uvMJnGDswIcd9/jhk/UgEkiK
 IL7eBOr23ZkjIYfi5KUgyIarOgPotxacn5cGM
X-Google-Smtp-Source: AGHT+IE2xPIqgDYMDkVhZ+0wWF3tCQ3Y1t5YGgN/I9e2VhXStjX52f82U/5la54x4iTVj8B/dfc51TU63Md/eZ4s4WA=
X-Received: by 2002:a05:6102:38d1:b0:48f:95cd:e601 with SMTP id
 ada2fe7eead31-49743b36d8emr1687799137.25.1723495238239; Mon, 12 Aug 2024
 13:40:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Aug 2024 13:40:37 -0700
MIME-Version: 1.0
In-Reply-To: <c2218911-650a-4f43-9119-bd2cfc46f3aa@quicinc.com>
References: <20240808235227.2701479-1-quic_abhinavk@quicinc.com>
 <CAE-0n53qMJVbfb9oXbDexqhOj6qTBq9k5kMj1e6CXadObhBmLg@mail.gmail.com>
 <c2218911-650a-4f43-9119-bd2cfc46f3aa@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 12 Aug 2024 13:40:37 -0700
Message-ID: <CAE-0n53WwLK_Zdf_-1ftUV7pBOj0Vw_uM3LhHdOpVhwY1ZJ0kw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix the highest_bank_bit for sc7180
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
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

Quoting Abhinav Kumar (2024-08-12 12:41:40)
>
> I just retained the same convention that was used earlier. It seems like
> a mix and match right now. sc7180, sm6115 and qcm2290 were using 0x.
>
> I can post a separate change to change all of them.

Sounds good.
