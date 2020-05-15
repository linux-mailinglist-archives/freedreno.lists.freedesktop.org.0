Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F1E1D422E
	for <lists+freedreno@lfdr.de>; Fri, 15 May 2020 02:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C3A6E3D3;
	Fri, 15 May 2020 00:40:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65296E3D0
 for <freedreno@lists.freedesktop.org>; Fri, 15 May 2020 00:39:59 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id b8so159230pgi.11
 for <freedreno@lists.freedesktop.org>; Thu, 14 May 2020 17:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MxFx2v3CXXJI2uqpzJc0nTIbU803tm+QFkEcg6RoGME=;
 b=ncWP6c8T/qeB5mTi8dmQ/2f++LBk5CizP09+SlPJnyCzgNs/XM3OV3LABFolMAuaaE
 UYHUIc3yE2lEXImqHTT1olFACAUL2RuRf0qtmuTLimsMw3ZEFjzxm4slAwvUIDb2cFT/
 wcJNyV8sDtE3sXgsivVXiTYvixU3wl/p0/67k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MxFx2v3CXXJI2uqpzJc0nTIbU803tm+QFkEcg6RoGME=;
 b=TckqV2h8vB597B9RpXuSvQ987IJtKhMENMVi0obec149FLiZ1pkZQWbDTVn5F3huKX
 yE/ygiPqxNyMdhoFlLI1eOCViJmxe3WBjVD+LTBnFv8xnE7SjC7nhbZPOCDlnBvMfgSd
 7r5djEskY3jhxq+gplDWjMgum8wiMon3dPc2vXQRy11p5AOLELd55HQGmmQszhFOQVjg
 9nwHqICT9KxUM4x/tz/HjoEj2f04I+Z7ICG4kZ+iIJw/AaWuIMlgpV6euPyBDAOUjsL0
 B0X4/oOjQvwaMNS++wkiUZZcVxiG6V7trsZrANnxE4Uo71edP2+9NgrZK317GI4WVTV3
 l0cg==
X-Gm-Message-State: AOAM530t+HS13Qauk6pO3wTaHk8YVi682N15UOQw2GuWJajm3XCxmBff
 83U13ndnTUpfLFXJTCgsUf3spw==
X-Google-Smtp-Source: ABdhPJyyWhg/HZloV77tc/5SwAYHguc5UciRxuk4OrFHLyBPk1weM70XMcLYipySphGQrca0OnCZSQ==
X-Received: by 2002:a62:3343:: with SMTP id z64mr1187982pfz.55.1589503199243; 
 Thu, 14 May 2020 17:39:59 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id 138sm334556pfz.31.2020.05.14.17.39.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 17:39:58 -0700 (PDT)
Date: Thu, 14 May 2020 17:39:57 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200515003957.GV4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-5-git-send-email-smasetty@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 4/6] drm: msm: a6xx: send opp instead of a
 frequency
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org,
 georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 04:24:17PM +0530, Sharat Masetty wrote:
> This patch changes the plumbing to send the devfreq recommended opp rather
> than the frequency. Also consolidate and rearrange the code in a6xx to set
> the GPU frequency and the icc vote in preparation for the upcoming
> changes for GPU->DDR scaling votes.

Could this be relatively easily split in two patches, one passing the OPP
instead of the frequency, and another doing the consolidation? It typically
makes reviewing easier when logically unrelated changes are done in separate
patches.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
