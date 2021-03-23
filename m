Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EF534562D
	for <lists+freedreno@lfdr.de>; Tue, 23 Mar 2021 04:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DD56E835;
	Tue, 23 Mar 2021 03:24:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 929CD6E835
 for <freedreno@lists.freedesktop.org>; Tue, 23 Mar 2021 03:24:44 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id v3so10327404pgq.2
 for <freedreno@lists.freedesktop.org>; Mon, 22 Mar 2021 20:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=hodATnKjKQUhE5+cuWqoiqtEQY4BaJr2OLA8v0fcrQ8=;
 b=Woqg7ffdwtVJhO9A1EbkRO1TS2BL2uMiyp1MfJVdCzkz8sIi14UbpOpAuy/p096EHV
 EcT5UvJu5TK5fVulp0NKDEY6zuub54j1ramn1RYwTLOGlCPjDtRfYrltZ74OujqduN0K
 gdL+ccqLFZAJ4xRZrI5x4Fe0pdfXST1p1wS8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=hodATnKjKQUhE5+cuWqoiqtEQY4BaJr2OLA8v0fcrQ8=;
 b=HM+Ssw5XKB0YvT7TDoTsTClhcc+adF8WtWceBkj/WICaQO1crREC2NY+kwgeBOVUsO
 IZ8Z/K8c9UyCL/yr2Ehx5FDqfnFcYBLskZ00D7KVccY6zsa0jx813D0oKjusjOL7Zdy0
 ODUxCqYGY9vKAKfaerNVjwQfKCO9A82YvqeUBrwYGj6aEcI323Z2gmgpD8heeeZTTv0O
 sncef6zS1QzHAch44sMvBy9qnChsQ9wb6kl59qjFF0e+ruKz0UycvDv+WmHvlKGpjX4w
 OXsinVNFY74k1YHxJ1dOHv14Ptf28vxdQ3eZqaUrmBXgcbEKNoxcvGWY8CpErY3NnWFz
 hrHA==
X-Gm-Message-State: AOAM531llbQ61LwLWujrSOPNAoyIPrls5T56wwif8HwhlTkRjsLFEkmP
 IrSnroIUWR6SnDYwEwXfLKw9lA==
X-Google-Smtp-Source: ABdhPJwQuMfvnRVwix8vZq60PYLbsuTsaoSc+9YR/JehIv2GN8pbSU2ylDpgKbh2R38rU+4g5c9xSA==
X-Received: by 2002:a17:902:d694:b029:e6:bc94:4931 with SMTP id
 v20-20020a170902d694b02900e6bc944931mr3157077ply.6.1616469884216; 
 Mon, 22 Mar 2021 20:24:44 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id l19sm735913pjt.16.2021.03.22.20.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 20:24:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210318062650.19886-1-unixbhaskar@gmail.com>
References: <20210318062650.19886-1-unixbhaskar@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
To: airlied@linux.ie, chandanu@codeaurora.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 khsieh@codeaurora.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 tanmay@codeaurora.org, unixbhaskar@gmail.com
Date: Mon, 22 Mar 2021 20:24:42 -0700
Message-ID: <161646988202.3012082.5548408805057433167@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Fixed couple of typos
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
Cc: rdunlap@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bhaskar Chowdhury (2021-03-17 23:26:50)
> s/modueles/modules/ ....two different places
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
