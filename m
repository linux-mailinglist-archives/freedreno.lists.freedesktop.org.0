Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7270878E3D2
	for <lists+freedreno@lfdr.de>; Thu, 31 Aug 2023 02:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC0410E05F;
	Thu, 31 Aug 2023 00:15:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9CA10E16D
 for <freedreno@lists.freedesktop.org>; Thu, 31 Aug 2023 00:15:19 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id
 3f1490d57ef6-d7b8d2631fdso93590276.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 17:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693440918; x=1694045718; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OyQ3QNWscfTpdGqgBgms3LPZL8sWGyfgTmegeYl8UhY=;
 b=lmzW/u1wRFD0HgVZzWLHw+exLVgUvZJuLAgRhY4vd5rlbHDPlym6Cot4jela4Lzyai
 fY8BbhFcrQJ6niPkzkQhD6h40MhyrwihYzHyP38gqz7kEtjLwDLpCYdvAVm/Kxda2TMk
 JV/VofehvXV0dr1TX579STEe3x8Ew3OB2Z4lZocpyqjM5zVKSeP54C/YTjZ7GGQnpM+Z
 LzFjqIPIzL9c6JE4AQ6M/xmc/+Xx2y/Dtdc/JlLcrCPlE71JkHWDdGyObLdfLWmWE4gh
 1RMc/PJcIMkYVeKzXk5+nCeuAXj12J5hiQv5TpqzGezm3OzD4jHUUjaKRcefx6lAxbLP
 quGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693440918; x=1694045718;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OyQ3QNWscfTpdGqgBgms3LPZL8sWGyfgTmegeYl8UhY=;
 b=JaTMV67bXi3jW9VRokRQa0E+6LI76GzYwJG+lQUg/mVek3czqK0+1TbM2FSVYldXSa
 my0cQy6ayIWbM8z6y+CTOWtByXicyvr5ZnE+p5fK8rDJu5STO/nYx2Jl4mvxTJgc7NO0
 /uuYcInq+KRW598gpknWWWdNogN2N6wCexO/Q327/uvcn99gUMZ9saCFsOBAfAUZ5Dcz
 NRSw+b58fIL3+aYSUDCvaI638wHJFGKefyEMLA2bQeBgTltiIoIqUqazsXy+l/yubiL7
 legEKB0toTqKLsPv1EP1NKu0JZ0jApREH+7BKHhqmrXdQDKHg9TJgmpaoogi3BDfZFKe
 mBPg==
X-Gm-Message-State: AOJu0Yx2Dp5cnWovyNrK9/FvRur1zG/tO7NurdeNQpHDTkMc7F3c+v3C
 1P2QDO+0iOSvSryeFOcMgbg9xRg1S950hOMNX3HIKg==
X-Google-Smtp-Source: AGHT+IEUgQBvI0sgINcVEP1+dB/cEnSbvMnPVtijtfAwJ3hr2IQuJhXns221D7jxzg+csWS71CBxDjIx0awK1xuN964=
X-Received: by 2002:a25:db42:0:b0:c60:982f:680c with SMTP id
 g63-20020a25db42000000b00c60982f680cmr3449214ybf.63.1693440918412; Wed, 30
 Aug 2023 17:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-13-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-13-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:15:07 +0300
Message-ID: <CAA8EJppJe-tvfFT7fO5c_Fyv1aAtniVcAk5wdWpp8FPwwki9Rg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 12/16] drm/msm/dpu: plug-in the cdm related
 bits to writeback setup
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> To setup and enable CDM block for the writeback pipeline, lets
> add the pieces together to set the active bits and the flush
> bits for the CDM block.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)


-- 
With best wishes
Dmitry
