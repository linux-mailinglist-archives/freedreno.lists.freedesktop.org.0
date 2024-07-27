Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0003293DF62
	for <lists+freedreno@lfdr.de>; Sat, 27 Jul 2024 14:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A6810E09F;
	Sat, 27 Jul 2024 12:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jLhr7jyJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E15310E09F
 for <freedreno@lists.freedesktop.org>; Sat, 27 Jul 2024 12:47:27 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-654cf0a069eso4903477b3.1
 for <freedreno@lists.freedesktop.org>; Sat, 27 Jul 2024 05:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722084446; x=1722689246; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qm0K2iiwCjE6zO/ZiafleFRuipXYf73kca2DfX3AnMA=;
 b=jLhr7jyJIDomgYbbLlRJTmCNHQjV+WgIguwLpCEm3KfzBXpD8UQvzpKBy79AQZ3K/B
 RTHEQkoIsDIhQ7WpG3c4g2pnG29wgUY4DriN1xiT/KBmPQ5hnCZeDLEPszHgtcpXq4Co
 Cx1zo0/4NXxlUbepv1mMSKge5kRGn4dhu68gIsJRrLyQmWNt7g1Fk294hv1JYVULdPX6
 KpRZF1DUJCjmkAnc/tH0mPBne+3V3NNNBBQwHJ5S4+mObyqMrt2jFrtAcuikQosEXLXq
 yHVXKadl6gpYP6JKmF+3Rm7bUeyYvH6pLANakSdKLbnHytpK93iSLkjbRIoZef+aES4s
 OIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722084446; x=1722689246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qm0K2iiwCjE6zO/ZiafleFRuipXYf73kca2DfX3AnMA=;
 b=O/8OMd2UUgPCPDt6vlFRmMkJSqGbV6Dj2jlW5PmW8ld3ca8uBbCr6J/FDqnm/+Bhqb
 7//NeS2cNEwo71VC1ETJO3ggNBlvfDC1Nkel2R8TrjPkm6FQr+niCLFVnJDPrQuXPylK
 TQWiQCvpbUwIqVsXNeLQHhr8dzZmY2WzTXZKRBkhHyC9QCCB2bewRRj4fTCTv7ulnWkq
 M3ECKPxE/NWvGXmg8hF2x7vpqJv1tAMupKcFc8a+LQxa6yLtscofZlxnwMvqiIDeWje5
 AkFyGQs7n/1XyS6wVFJmQHkcXJ/uxlCmvZB5qzzE7H4I0x8RuSOHhtrZyvP+Iw72jx1f
 5jKQ==
X-Gm-Message-State: AOJu0YyK1hR0J3mkTK5WGKCYHe8UrHnFlAR+m0yQ11ZTPwqXSXORgYas
 cHwbxpJnissDG1FkUjy75mgG/BM7u/meu4dEON+2KJdI0eyPHowudHgT3lZdzyAfUuSNC4L5W2v
 OX/E8M7OjCseSy7J+1mhugxKTUL6T1HDDmQCObA==
X-Google-Smtp-Source: AGHT+IEqbcAV41X4ysEtg0m1TQxIoMPD89y9he1KPVTcI6Tf0/ta8VQ8uK6NG3kpYoMoSd/HctShnal6IEhL9nfMghI=
X-Received: by 2002:a81:5c87:0:b0:650:a1cb:b122 with SMTP id
 00721157ae682-67a07f4ca6fmr27053727b3.27.1722084446649; Sat, 27 Jul 2024
 05:47:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240725220608.131426-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240725220608.131426-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jul 2024 15:47:16 +0300
Message-ID: <CAA8EJprYPq4gj3ZWexWW9jNc2806Q8VHEx-aJA4R-jFd76W=AQ@mail.gmail.com>
Subject: Re: [PATCH] phy: qcom: com-qmp-combo: fix swing and pre-emphasis
 table for sm8350
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
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

On Fri, 26 Jul 2024 at 01:06, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Fix the voltage swing and pre-emphasis tables for sm8350 as the current
> one do not match the hardware docs.
>
> Fixes: ef14aff107bd ("phy: qcom: com-qmp-combo: add SM8350 & SM8450 support")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK


-- 
With best wishes
Dmitry
