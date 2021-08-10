Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7328E3E8306
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 20:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E0989708;
	Tue, 10 Aug 2021 18:32:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9680089708
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 18:31:58 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id be20so420982oib.8
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 11:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=bRoFoIrgb6DbxUcPZ4qNbvdQX1dffX7W/rihsgTb2z4=;
 b=QWJyaYLaSvyDInTM/b9ve7OmtT4fI/gbefn4OkqqYoJoS7qSL4WjCukVdCd2aFJn2+
 zgWtJrsWMWdriv+2tJAI0RqmwdkA/XtnmcxTNQ7J1bav4E8LazOhIbDE7cG92Wk9e7aA
 uptQrHkXkrQlnroBRb7ExPIZiqo7aqnrrjCRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=bRoFoIrgb6DbxUcPZ4qNbvdQX1dffX7W/rihsgTb2z4=;
 b=De8XiF5SBJPpE9zW5EuJBAhiHvuYMZZVITlG7C9d9x2CnvHukAzE5VpVy6RlNK+fsd
 LdMY7Pu6Lbp+W4gl/8U3u/LrY1PtuD3RQUCBfRCb0WdZ7zPo5eWS+qXuLn0c+Obe1djn
 urS4eyBpop5xSDIBkI/P3xPfG2PvmaReo0y8PN0WrduWY6UuRyF+wVd48jNZ5qPUAMbK
 hLf6bm6zh9JEcO0JMcEh16ku5mrM+kfL9Qw/9PTny2qx7ec4B4u5JSnVETsiOKZC15b4
 g2tHCGyXLyrEDlmyOmctKfhOT+VgwLhwB9CiX5re0l+Kg06Co/SgLBJysmo9uMcyyz6x
 TVyA==
X-Gm-Message-State: AOAM5317DE1CQga0sDREo9N2UtI3ttQay2QeQBgQBiTgQtyzd5+kNMGt
 2cXOg8uihQEc52HRLuou/GuUMTCuyfOGaqlH0Rm7zg==
X-Google-Smtp-Source: ABdhPJzuO8bdHRY8YfA6qtIShSohbIviDAruhTY93vX+OuVbguE9JaTNgfjrPkPDvsy+kBJf3jR5BGgDV0t7AZoC898=
X-Received: by 2002:a54:468d:: with SMTP id k13mr4595160oic.125.1628620317662; 
 Tue, 10 Aug 2021 11:31:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 11:31:57 -0700
MIME-Version: 1.0
In-Reply-To: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
References: <1628609362-2109-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 11:31:57 -0700
Message-ID: <CAE-0n51wQMmL-TYshTugGbR7JNnVeTq257OQMMQ6LSTcB30w5g@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: add drm debug logs to
 dp_pm_resume/suspend
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

Quoting Kuogee Hsieh (2021-08-10 08:29:22)
> Changes in V2:
> -- correct Fixes text
> -- drop commit text
>
> Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease of debugging")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
