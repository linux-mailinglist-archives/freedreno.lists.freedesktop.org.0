Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CD831EEA4
	for <lists+freedreno@lfdr.de>; Thu, 18 Feb 2021 19:46:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307226EA55;
	Thu, 18 Feb 2021 18:46:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D106EA54
 for <freedreno@lists.freedesktop.org>; Thu, 18 Feb 2021 18:46:46 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id t2so2075128pjq.2
 for <freedreno@lists.freedesktop.org>; Thu, 18 Feb 2021 10:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=TYSvMCIPacqOphOa16rzA+X+0GuBxuIS4Qj5ygoV2IM=;
 b=aWV5hnEy8rnECOEGtDuAcE+s4yLDrZzLFVj+vn97GLn50xSeuxHfgdHF7Yz6jpcksB
 CYfZpw1Zh4nmKvytWq2vjdYlJZlmbDpatiO45blzVexSo6J8CdGpJ/r3/Jfht+NfQhSW
 LOtBc1iiEAii0nADT1I0ZZyiE9uk7n6kjhupE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=TYSvMCIPacqOphOa16rzA+X+0GuBxuIS4Qj5ygoV2IM=;
 b=GFqIwalXkUJKJunVzK8yaJfkzYKe76yMjWQr2Ficl93hcctyM1tI2OeADaO7LrTm4G
 Zi7CLnjbsnejc1Pqq9wmd0DCPDbrhoafaVQ/b321M9cGJI4oqXuON47cSlG31v5tcTrp
 jFkTtpq3k3uCp9DSKlXMnXWRbrYveFV3ECodMLR4chRnfHiJwzY+BsrBghk/WJWScZRA
 xR1USlNdgfWs2p5GFSYf8AyHbGQ0rxRwu/MbYPOgxXExTowo32QQwGOggftDkrzhL+Zv
 Gkvf3zvAwoGWBFoyCBUcJHYF6kVMwWR5ojnOkt8oDqp8bRWleKlTTdBsmF/s/ZT5U1Xm
 lGvQ==
X-Gm-Message-State: AOAM533n8Bya0PIaL53OlmMm5M5kodbhQ4nFa5UFYtlNE2cV5f3D1W2j
 FFtuodSTm22y/XsjhM6HBmW/SN5duXTv8Q==
X-Google-Smtp-Source: ABdhPJxCmb8Y1Km73TqeTEgYOkLH188D40vElREuf0w7ub9wbnNw7oCNpoGFosfaLftBUBdQlyWCeg==
X-Received: by 2002:a17:902:aa03:b029:e3:721:c093 with SMTP id
 be3-20020a170902aa03b02900e30721c093mr5267903plb.50.1613674006193; 
 Thu, 18 Feb 2021 10:46:46 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:ec84:ed2b:a796:b756])
 by smtp.gmail.com with ESMTPSA id 25sm7127704pfh.199.2021.02.18.10.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 10:46:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
References: <1613603397-21179-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Thu, 18 Feb 2021 10:46:44 -0800
Message-ID: <161367400432.1254594.2213007173465217655@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dp: Drop limit link rate at HBR2
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-02-17 15:09:57)
> Drop limit link rate at HBR2 to support link rate
> upto HBR3.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
