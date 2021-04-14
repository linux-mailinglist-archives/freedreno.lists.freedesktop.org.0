Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC18F35EAFF
	for <lists+freedreno@lfdr.de>; Wed, 14 Apr 2021 04:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B2B6E42C;
	Wed, 14 Apr 2021 02:41:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD276E42D
 for <freedreno@lists.freedesktop.org>; Wed, 14 Apr 2021 02:41:08 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id u7so7476621plr.6
 for <freedreno@lists.freedesktop.org>; Tue, 13 Apr 2021 19:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=IWQ8kZIVlGhQD8+fDUl3Qr87vRGoEpJEhZ9a36cdmds=;
 b=GhUjZ2ZzTjpi1biirHOduFNr3NQBYkkJ5xRA/5xxo7UwrTjpe5gMi42KF/VcAgf9rB
 sucr6zJ0RA7Zb6zUP40T0031wV3wN2+mdQS9op63T/qR/NUQDJNAGnN/xi1AAXdsYlBO
 G62pKW/wz39ztJxtonQWrGCIbwKywdy2TXntM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=IWQ8kZIVlGhQD8+fDUl3Qr87vRGoEpJEhZ9a36cdmds=;
 b=XbH1Id8vN8aE7OmmdWKYOBvHPVZvb4q4PS9XJ3aQHSwQs5uH9jJLk1zRemM0CIwrcT
 CWgaYgBCzpU/kIzcaUZWTsThvVUXl8eyBmYnZ+aSlw+/uHKhQNzzK3D5IurbuJ8Uw6ND
 c94T/EP5B+I1Wp46xRF80TfyWUQht+R3c0CRepMSr9MWBEZjYdykVfnGQLMqJTRrD5XZ
 IiTaRueQHE7W8enrnA+7aAXGp+pPEtO3PlrFk/ayLKxTl6B47djJurHDaP0sZLMlGevA
 abcnzOqI6CeUyiCgedMZRjBoSHNKp8agX9VP0MhVwMbV9LJTJSpzqSW3yOO96Wsj6ft9
 TaXA==
X-Gm-Message-State: AOAM53277NLH6wAuaTnHuDL8oAj/hdx77zk2XHBwqc4fHl9ZjQMoD+zY
 hRDnD5JT6jg+nJVws15MHA0V+Q==
X-Google-Smtp-Source: ABdhPJyWXs4uv20lp9C9gM9mn6ADAno63aDcQTRqZNWrgUoUHGkLTKU1PClRdBDVvX1u664CF+3CWw==
X-Received: by 2002:a17:90b:33c7:: with SMTP id
 lk7mr951786pjb.95.1618368067895; 
 Tue, 13 Apr 2021 19:41:07 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
 by smtp.gmail.com with ESMTPSA id x125sm13272511pfd.124.2021.04.13.19.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 19:41:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618355470-5226-1-git-send-email-khsieh@codeaurora.org>
References: <1618355470-5226-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 13 Apr 2021 19:41:05 -0700
Message-ID: <161836806593.3764895.3487656287937752851@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2 1/3] drm/msm/dp: check sink_count before
 update is_connected status
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

Quoting Kuogee Hsieh (2021-04-13 16:11:10)
> Link status is different from display connected status in the case
> of something like an Apple dongle where the type-c plug can be
> connected, and therefore the link is connected, but no sink is
> connected until an HDMI cable is plugged into the dongle.
> The sink_count of DPCD of dongle will increase to 1 once an HDMI
> cable is plugged into the dongle so that display connected status
> will become true. This checking also apply at pm_resume.
> 
> Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and pm_resume")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
