Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310C89768B
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 19:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD17112DE2;
	Wed,  3 Apr 2024 17:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NW0Iij6B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629D0112DE2
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 17:26:45 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dde0b30ebe2so156939276.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 10:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712165204; x=1712770004; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W7QRRgKqsXwD5sSRDZZ8VcuFdOzjyZfFtngo+Xri/jk=;
 b=NW0Iij6BNa+VNEeKxDRGPlCQpodX3W4G7TrSQ08PAzMjInESp44S0+CFvCMc8YOiGx
 Z56xI/C5hfxExWCaLD3fxcFWLu3XhSZoq2uuUrRj295m/lFF97ZXD0Wd7sFWlUPlq/Oc
 MSKV1donffp0U1KKv5E9w+OwmAotJWSS1BPOueSU3wHGAsbzUQiWIWMIspvFk3IoNY9l
 fl4D8zp2uMEYkx0PqKz9nToT40Vn+LIjjViz8ZZSViCq5qP4GglL4V7lnvqD+IRgld2w
 oxBzwF7XIFHC0nl4V4QYT6BWihs0G4X9C923ARX9b64kVmx2rXspV22aBo5Mm48u8jm/
 VBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712165204; x=1712770004;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W7QRRgKqsXwD5sSRDZZ8VcuFdOzjyZfFtngo+Xri/jk=;
 b=sVQaP5DFi8b/cx0vXR/qq71fu5wHemR8KGJ6OOHVY+QfK3k/brY/Ad7x/7E5RNuSbx
 IvFEteHWgSNTV6gZKSjNDqXDGcDLLzpqwhIXsg+jGJUTCImK2Ly8pXO0zEylO9yYJ0eW
 S6oDrMe/VzL9qlX2Spyk4BQmGtoWeVHRenfCaiGS4jGNuVCIdmKmIpWT7rV3/NVHXCkn
 T5sKG6RE2p/kUy+CQ0RScUHSzcr0WN7ahGvHzcHQVEXxvKQVXNNYc5zKGwTQoLbohCK+
 z9AIDOVOapjfF0ULG9TRoUk22GRw9UmDQqk2yMuevgDIBAOXcvSTwGXCOOVfbvOAs+Fo
 HWuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDa4hK0sLapmyYJP9mR1Xp9GkABAfWPePbO6OzEpIn0tEhWAXrDylhKA+5pqWTsqj2xG+1vyTG+66QasTbaA2i005npabKxcZpkVq8G1Z4
X-Gm-Message-State: AOJu0YygG+4HrGNJARuriiHCZtb7yUXseSMn6JbBGC/cy0H7FR0oRhZK
 VBTa/nC5S01OkFP6Lb3Wm3Hh3JLbzFDh7qDKju8hOWP+h2duTEdE6Ai7hiWLzUqrO9vMds+Wgs3
 GnQN6qs6CJZDWCrkaBU0qYZxlFfrGp7f5Tmm1aQ==
X-Google-Smtp-Source: AGHT+IGKs4UZZu1uWec/JwUPIddWSalxBLmZpFq3atHbYhG7vywkXhdOnRse/O/THqsDCZtUL5neZXBtsuKX/2xQd+w=
X-Received: by 2002:a5b:a92:0:b0:dcd:13ba:cdd6 with SMTP id
 h18-20020a5b0a92000000b00dcd13bacdd6mr116607ybq.47.1712165204168; Wed, 03 Apr
 2024 10:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <1711741586-9037-1-git-send-email-quic_khsieh@quicinc.com>
 <f0dcfd6a-55cf-84d8-6599-319a700e1960@quicinc.com>
In-Reply-To: <f0dcfd6a-55cf-84d8-6599-319a700e1960@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 20:26:33 +0300
Message-ID: <CAA8EJpqWa0bcV_ucsyM5_sSu3d0_XFjnNdabUcbq0muHtx_YWg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: assign correct DP controller ID to
 x1e80100 interface table
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
 airlied@gmail.com, agross@kernel.org, abel.vesa@linaro.org, 
 andersson@kernel.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
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

On Wed, 3 Apr 2024 at 20:24, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Dmitry,
>
> any more comments?
>

No, it was picked by Abhinav for msm-fixes.

-- 
With best wishes
Dmitry
