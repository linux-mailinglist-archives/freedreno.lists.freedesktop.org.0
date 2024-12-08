Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 805639E8448
	for <lists+freedreno@lfdr.de>; Sun,  8 Dec 2024 09:51:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5123610E254;
	Sun,  8 Dec 2024 08:51:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Kw0j5VBi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4076E10E254
 for <freedreno@lists.freedesktop.org>; Sun,  8 Dec 2024 08:51:39 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so607551e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 08 Dec 2024 00:51:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733647897; x=1734252697; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uhNcbbr16rCA3/JeSUAsY4Iitw9SPQbHFYkFe1dOMAY=;
 b=Kw0j5VBiXNJXuxMElbwXF4rNYPfjoITShdSkPcW8rvOtx373cU78vMiO235nmmrUmT
 rqnfx3QGvy8Mhk/sWqjK9vMGfWC+4VNjRKPAbbEv1ZX3DXDzjsKrDsYbn4M9v+gI+wDu
 HePSZMLZywnUrMoc/oq3Th7aj5az1g0ziLgCDrFvt8HBrAsIqc2aRSPfM/VI9aSBZCfi
 MF/cGMbyYtHQKajyGllj+c/GIadVHAnO9Hh4ODrLWor2gvUvdY5JhNmf1crC/gubt983
 zm57kiwRDMgJLZ8zF2I6e2c0NsyDKK03BEASIPM1cqcMYbZJYscDfXtdnbLWrz3ong1Z
 A4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733647897; x=1734252697;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uhNcbbr16rCA3/JeSUAsY4Iitw9SPQbHFYkFe1dOMAY=;
 b=jIKtEPrTzsW2yHR8pYjxhcMVMt4u9fdMiLds0C5x+9aN8+XYu1a2RAbnHPBP9lR8Kq
 nXt3/XFa7Mk5kTPdPmX5DfmPC6Dk+SDpF5aI0oZuSxXxzT0fR4J2cwUP29/YzsAQplRQ
 4+mn0eUsD57+bIi2KRzFjrj0UtXqyke72Pxu2Aap83fG1pDV0nDHB1dqDU422pCWXvdx
 AZb+dw7keWwACjly56Su93jZTZ0WICbkVFd5oJHjqwl+9mhPUGwFgCFqTYxqVZRb1aqZ
 DxUpsbcf7fN1sd5PrBd2maG4GrxQga0RI7mc6RSBu0fUACO1jFZOrNUg4GQrwbmw/OYu
 ibFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDi+ba8PAz9wFtId5FNeyIgkfyRox6mb88YGiU3u/NhxobHfmNQc/CXZfuiz/+C9WZurgUyAfu0mQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVkftnWXniHSrNTNoha+zJy0ZbdezVM1sj9iGqicmT8l3n692c
 /Lhu0XXC/jlICgqOqFqi6JtkonyWl8UPLfmKIdq2G3NVWM2d//yHdi+v8TGU68A=
X-Gm-Gg: ASbGncvbfvB9prYepz+ufgF5cYbOOAeubKpLxlalUEVzPgysHJ0UXKLGbe2hCNr1GLi
 Y7zv8XcDZW8moXKQo2v+sKU6eono6+vLVka0tbcQLHSvO69TSfXPTNNhINkRl3cIwqD0NKV67tG
 FwC014g0mniAtAkrCNg3noc7q+ik7LokJMWN/nRFHFLbLEM8xVscQb+FtZva7438aHcq4qveGPs
 3qB7ZmjIBt//YVgGZx4av/AMlN6tiGyayKPkyZSQX5bSi9FFItNkcHJBwZ/84AyBBd5NOGHvXLj
 H+/YFj+uECJ77vS04KhANIqOTzW42w==
X-Google-Smtp-Source: AGHT+IHiwphjww0ZX/ARCaOQWbDtkiMp61r+FZ23Ev0IT+2ZIgkD8Jn/Hmmxto1mAzafzC+0GFmXvg==
X-Received: by 2002:a05:6512:3e15:b0:53e:38df:673d with SMTP id
 2adb3069b0e04-53e38df6949mr2968634e87.43.1733647897072; 
 Sun, 08 Dec 2024 00:51:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ca282sm1033705e87.241.2024.12.08.00.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 00:51:36 -0800 (PST)
Date: Sun, 8 Dec 2024 10:51:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 30/45] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Message-ID: <akhwuvpxxsjmejbbwksf3uty3cs3utian2vsmalrtfxbx6h6r6@pcrlpelx3545>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-30-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-30-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:01PM -0800, Abhinav Kumar wrote:
> Add an API dp_display_get_panel() to initialize and return a DP
> panel to be used by DP MST module. Since some of the fields of
> DP panel are private, dp_display module needs to initialize these
> parts and return the panel back.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 28 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
>  2 files changed, 30 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
