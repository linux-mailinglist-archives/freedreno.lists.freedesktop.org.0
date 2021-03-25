Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A53FF348959
	for <lists+freedreno@lfdr.de>; Thu, 25 Mar 2021 07:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4F36EB2D;
	Thu, 25 Mar 2021 06:51:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D416EB2D;
 Thu, 25 Mar 2021 06:51:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7517468B05; Thu, 25 Mar 2021 07:51:15 +0100 (CET)
Date: Thu, 25 Mar 2021 07:51:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20210325065115.GB25678@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-16-hch@lst.de>
 <3e8f1078-9222-0017-3fa8-4d884dbc848e@redhat.com>
 <20210314155813.GA788@lst.de>
 <3a1194de-a053-84dd-3d6a-bff8e01ebcd3@redhat.com>
 <MWHPR11MB188688125518D050E384658F8C629@MWHPR11MB1886.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR11MB188688125518D050E384658F8C629@MWHPR11MB1886.namprd11.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Freedreno] [PATCH 15/17] iommu: remove DOMAIN_ATTR_NESTING
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
Cc: "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Will Deacon <will@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Li Yang <leoyang.li@nxp.com>, Auger Eric <eric.auger@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 06:12:37AM +0000, Tian, Kevin wrote:
> Agree. The vSVA series is still undergoing a refactor according to Jason's
> comment thus won't be ready in short term. It's better to let this one
> go in first.

Would be great to get a few more reviews while we're at it :)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
