Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24E0467257
	for <lists+freedreno@lfdr.de>; Fri,  3 Dec 2021 08:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C1472FA0;
	Fri,  3 Dec 2021 07:00:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46E372FA0;
 Fri,  3 Dec 2021 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=L9TEsOSb6kRI6cv6AHNLCgEMmFVJ2TwOFsBuT0mf2uI=; b=WJ8/zUe+SXuI4BfCR+BUL7Vkst
 WOwpe629JqT5Ndyc5srczyQ4GFkF24TYiT9Ch+yu8WMHtIQ/kJXhe/tuz17Cebczq4jV8M3AysQi5
 IgnYWA1kanCUQrzI2U5A3adQJk08pfuWgEJBtPO/lspAYfPYeqYQt8PgEhjJ0Qd/1dSX8qSaPZBFp
 VDcLl0khw9Eoc+u80YauIiJ5fAb/cmt5z3dorT2qy/OKtIwbKJDwXRoiU0cYCt2N1MD16BOV5V7Ow
 A1b7zYc8+EHrUAHlxpQL3ln0AcvSdc3xmv6xquHn5CofPFcYFWarkubJ7fDXuxOSQm8ryuWQcS3Se
 gQvjr07w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mt2Xj-00EeJY-SA; Fri, 03 Dec 2021 06:59:39 +0000
Date: Thu, 2 Dec 2021 22:59:39 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <YanAW6KnyNQ1V34r@infradead.org>
References: <20211202203400.1208663-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202203400.1208663-1-kuba@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Freedreno] [PATCH bpf v2] treewide: add missing includes
 masked by cgroup -> bpf dependency
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, songliubraving@fb.com,
 kafai@fb.com, airlied@linux.ie, linux-pci@vger.kernel.org,
 joonas.lahtinen@linux.intel.com, ast@kernel.org,
 dri-devel@lists.freedesktop.org, andrii@kernel.org, a-govindraju@ti.com,
 ray.huang@amd.com, sbhatta@marvell.com, robh@kernel.org,
 lorenzo.pieralisi@arm.com, daniel@iogearbox.net,
 krzysztof.kozlowski@canonical.com, john.fastabend@gmail.com,
 hkelam@marvell.com, geert@linux-m68k.org, matthew.auld@intel.com, yhs@fb.com,
 sgoutham@marvell.com, thomas.hellstrom@linux.intel.com, pawell@cadence.com,
 tzimmermann@suse.de, mani@kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, kpsingh@kernel.org,
 rogerq@kernel.org, linux-samsung-soc@vger.kernel.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, bhelgaas@google.com,
 sean@poorly.run, akpm@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, axboe@kernel.dk,
 linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 lima@lists.freedesktop.org, linux-mm@kvack.org, jingoohan1@gmail.com,
 Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
 christian.koenig@amd.com, robdclark@gmail.com, yuq825@gmail.com,
 daniel@ffwll.ch, gregkh@linuxfoundation.org, bpf@vger.kernel.org,
 colin.king@intel.com, freedreno@lists.freedesktop.org, gakula@marvell.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Thanks, always good to see someone else helping to unwind our include
dependency mess..

Reviewed-by: Christoph Hellwig <hch@lst.de>
