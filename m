Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC154DC15
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 09:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9980D10F0E4;
	Thu, 16 Jun 2022 07:44:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C63710F0E4
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 07:44:44 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso973733fac.4
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7kECHAE+GXQYNLXmd8ZAfx5ZSTEycGpfhYD0voXiTLY=;
 b=ZlB6csKF4ISyBxvF3WZVmH3ccTYq8q4zos7p5zIrY45z3g2k0cOgnf+AM0UMcW2kOY
 eOvxJHlLzUFnUYOpkDTI0IyCG6rv7wCgMPUeERoOUGhv0WeyUHCmnKDVV7QvSp84BFbu
 k+cLWnWHOoAaGRUXFo+K3yI/RQyjA3047e6m4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7kECHAE+GXQYNLXmd8ZAfx5ZSTEycGpfhYD0voXiTLY=;
 b=Wp80qh8lLGyM3jDU0J98gzV7okUpVLtpLdUbfyivXqQLB3dWSL7n7HTuT4oQdQ7qWO
 n0O+e0c/DIPmucRLcRjhbqozsMi2Kw/CX+rVot13b0OrMM4iRk9y0VMhyTgY5AZ4H9+N
 lYUqCWil5XubZ9fkDie5HVqgMm+GCiGA5cqXaWMbMmWKqqN7A7UvwFs8KjhoktjS5VHH
 TIAPbwaiRLx5z04B6Vxmfz0usmavsak6aibN4JVBDMY8v+adZy4svL5/IUie+Adq295M
 iTuGdoWKfPu+EwM+Yhg8UC1IHw3bs7WEIsGDZhRrW9gKx4HwANYz+ezyvap/YWRoGx/y
 JJFg==
X-Gm-Message-State: AJIora+KjdU5Zml/3zmhNmIaFApA1M3LEsofzV++8rZTOojpRNn4CiKx
 tyHuOQXwVh4nimnEJ+ABzXLVHRsGh8a+ITdDB0l2PS/Ah8Y=
X-Google-Smtp-Source: AGRyM1vropgb4ykS9bw8dwWFYy2i5x4/eBW5pZbUUEFI8RXotaQSBW4hF9nijvQLZFy5GYwRMk2MzJTUIy2iyjfCkaQ=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1973274oap.63.1655365483669; Thu, 16 Jun
 2022 00:44:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 00:44:43 -0700
MIME-Version: 1.0
In-Reply-To: <20220609122350.3157529-8-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-8-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 16 Jun 2022 00:44:43 -0700
Message-ID: <CAE-0n53dmgHDzEzKnRAX+1e-G5zYmvhSD9F0CaDMYzZyedU-ow@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 07/14] drm/msm/hdmi: enable
 core-vcc/core-vdda-supply for 8996 platform
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-09 05:23:43)
> DB820c makes use of core-vcc-supply and core-vdda-supply, however the
> driver code doesn't support these regulators. Enable them for HDMI on
> 8996 platform.
>
> Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
