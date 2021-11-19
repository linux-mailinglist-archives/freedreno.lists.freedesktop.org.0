Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2215C456E8A
	for <lists+freedreno@lfdr.de>; Fri, 19 Nov 2021 12:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FC5F6ED9E;
	Fri, 19 Nov 2021 11:56:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69A26ED9E;
 Fri, 19 Nov 2021 11:56:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="297818060"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="297818060"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 03:56:04 -0800
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="537081383"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 03:56:02 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1mo2Ts-0002Y6-9T; Fri, 19 Nov 2021 13:55:00 +0200
Date: Fri, 19 Nov 2021 13:55:00 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <YZeQlGUMhb0RLiU1@platvala-desk.ger.corp.intel.com>
References: <20211116003042.439107-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116003042.439107-1-robdclark@gmail.com>
X-Patchwork-Hint: comment
Subject: Re: [Freedreno] [PATCH igt v3 0/4] msm: Add tests for gpu fault
 handling
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, igt-dev@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, Nov 15, 2021 at 04:30:38PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The first patch adds a easy way to write debugfs files (needed to
> disable hw fault detection, so we can test the sw timeout fallback).
> The second adds some helpers for cmdstream building.  And the third
> adds the new tests.
> 
> v2: Fix headerdoc comments in first patch
> v3: Add helper to detect debugfs files and updated last patch
>     to skip the one sub-test that depends on new debugfs when
>     running on older kernels
> 
> Rob Clark (4):
>   lib/igt_debugfs: Add helper for writing debugfs files
>   lib/igt_debugfs: Add helper for detecting debugfs files
>   msm: Add helper for cmdstream building and submission
>   msm: Add recovery tests

For patches 3+4, in case you're waiting for this:
Acked-by: Petri Latvala <petri.latvala@intel.com>

For the record, msm-specific test case changes don't need to wait for
review (see single contributor exception in CONTRIBUTING.md).


-- 
Petri Latvala
