Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C94B20529
	for <lists+freedreno@lfdr.de>; Mon, 11 Aug 2025 12:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B576610E419;
	Mon, 11 Aug 2025 10:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cUMKBBWj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB62B10E418
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:22:35 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BAGpqR024514
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PPcIqJTmGqbCZt8ehrODmErw
 r7fSzpLsxZ7IoVmL2lM=; b=cUMKBBWj3EH5NRlROXLfL/zm1GMoUGSautoC7RSi
 1wFAYWVWYFr/14MQamSCXshR1yf0ddt7QdUlouf92lq6IqdPgv4cA9Us92bgpe/Q
 XAMtRfmEcewLgnxHI4mSVG8+gPnGySDiAUJOynQbjNbH9DGSd1JshvuIPrzNPJE1
 Tt3E/xNpMRfKdEnS3PHRhdYJb0Q0S+/jL9an1IMQJkAHT+fzc4i6aAy3O5pL8+Je
 Ul0IgWc8WON1I+6X9Pj7aCra3mBe6gCHvMslmeVu44jmA3qyjLdIINq8Aaz7E2DO
 udYJwqmIwSKNKk4/64boVtbG1TXvi972gfJNlnd8FlvEnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem480cm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 10:22:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b0a3557d05so87734081cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 11 Aug 2025 03:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754907754; x=1755512554;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PPcIqJTmGqbCZt8ehrODmErwr7fSzpLsxZ7IoVmL2lM=;
 b=sRGfCYSKjxs6FE4zN0vxsfuYFt2oTRaPxFMlaYiwJIiU5SWQV9ehprU0IE4KvcNb9V
 VsH6sPtOGwDH7k7+m3ODiFb8jgRU7Rm8Jz7L92BDC+DzGnZoR2fPCBsA7oIhUFGJ+w3n
 HmCavr/tLHcRHfDbin0N/NeoYuqSXSwWLfwV8O/rH3aC5OgL5OeUZH6r6HTK0ywqqBKl
 3zIjQJYQk9z6iJiLPoDOsMxUcstFvrrDU661VX/mGiZZ4JOnJsCKXpo/Gv0j1BnYZG4k
 LdcUwwGdVXB9gvl5Ncba0vuyDD3CJEX8dpLTfNlmcFdexvJmcfrpUesskint7DpXSJo1
 bcMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVswEYT0Ta305FUKhEgN/lY2voIM548Ne+us0dvm+mJ+QzT2kfHxOu9gsS9Hy32qfkBgywMKIK0KL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXjj1sCSxsPoVicCjdM5iJoODpeJGxVDp5VqZln1MmdcjxDQE6
 sr+tdOK/VrLcEX/F04l0lAQMFJJQMbmXmFW66/taEQ8YLh1MKjsVhRJid8qTt26rhbN5JRSwSVX
 pwD1z4QEa5EZfD09YtKnF8oTjimhVO/dMtF57kz+OljEhKHmfr5DOW26Jh54wfXHe9tKUvOo=
X-Gm-Gg: ASbGnctcKeultM5reFgySZ3OpG0tUcm9GJC2uZsgoSB9tWo+TlCDA5gw4ROitEd5lwc
 frDS+V/3/96RNnZTJBw/yd16PseNT/qNYNIIeb4rDBTXxzwBHZjhYTG8oUTxoqKd77CftBCihQg
 pwBCTWD7YamPpVFepjtanQgQW5T5ySNQf1j8MZn6945BL32L5ApPElSHvq3GtT1ihNhcVicgJdK
 qOPXZHg1KOnEhdZIyxcSMFN/rs3lNIOKPZVN97/I84WXpGw3QndpD5X4io02Qfw/Z7dqA8Eoh1K
 Di5p8rL2IcTPTq+xjCS3SaiRG6OR4kB5iG/wpFWFFosADF3riTMpjzJW/EdoF/tVEUaVmQmVA6P
 w8xOiOv/Pvz4pvP5O/YFo55Bds2fXZ9XvtHNaKHsMSGFF3P0QBCQa
X-Received: by 2002:a05:622a:1887:b0:4ae:f67f:58ef with SMTP id
 d75a77b69052e-4b0aec9df29mr168325981cf.25.1754907753783; 
 Mon, 11 Aug 2025 03:22:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/1O6odL8qEXPebSXBi5VVqvakd8Iz/cxzY+rK1t+2/oJ2Ljc14sGyM/aY/rldP9dMAv6Tpw==
X-Received: by 2002:a05:622a:1887:b0:4ae:f67f:58ef with SMTP id
 d75a77b69052e-4b0aec9df29mr168325461cf.25.1754907753078; 
 Mon, 11 Aug 2025 03:22:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332389409f8sm43713731fa.76.2025.08.11.03.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 03:22:32 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:22:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, kernel-list@raspberrypi.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 uma.shankar@intel.com, jani.nikula@intel.com, harry.wentland@amd.com,
 siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, mcanal@igalia.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
References: <20250811092707.3986802-1-suraj.kandpal@intel.com>
 <20250811092707.3986802-2-suraj.kandpal@intel.com>
 <20250811094429.GE21313@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811094429.GE21313@pendragon.ideasonboard.com>
X-Proofpoint-GUID: fJSz723Cxxpn_byagcGBWYQuM5KK6LGR
X-Proofpoint-ORIG-GUID: fJSz723Cxxpn_byagcGBWYQuM5KK6LGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX62OEhVpcFT+o
 xPjQM2sF1KQuh9GLq+SW9m+k3BV4h8YMAsoXPtx+24+c+9Br8tziRksreRWc/KbBDbOygPzNOyf
 /jNh63nn9VCVQnWZ+dCQeThGKh63OWproRbtHzzM+yTOe6/Xw7+otBh0I46ROfms2lEeY241Eu1
 nQVzrO2Fh7V/5NJIdJTrMyqJcYJ8SZdd7CjdDXkNO8EzBsyKb+9EW0psGgtVoBRR2hk51uXxFdM
 3E0Drv6BKXf11Ub7yzisQYVD9SutwVImSPtA50NgcyJKbYWyaOi60y99S+tSpeMR8hAWt1jlJAv
 6iO4OxA57k2K44qyhSuYEFFvTcw65AIhIZO5REokSHWkV3l6+EkvBL29WLQu9sGkTC+AdXmt9OH
 3ZjTYLoM
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=6899c46a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=-rapNmeMCNZ-4dkNsN8A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_01,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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

On Mon, Aug 11, 2025 at 12:44:29PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 11, 2025 at 02:57:00PM +0530, Suraj Kandpal wrote:
> > Some drivers cannot work with the current design where the connector
> > is embedded within the drm_writeback_connector such as intel and
> > some drivers that can get it working end up adding a lot of checks
> > all around the code to check if it's a writeback conenctor or not.
> > To solve this we move the drm_writeback_connector within the
> > drm_connector and remove the drm_connector base which was in
> > drm_writeback_connector. We do all other required
> > modifications that come with these changes along with addition
> > of new function which returns the drm_connector when
> > drm_writeback_connector is present.
> > All drivers will be expected to allocate the drm_connector.
> > 
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 33 ++++++++++------
> >  include/drm/drm_connector.h     | 60 +++++++++++++++++++++++++++++
> >  include/drm/drm_writeback.h     | 68 ++++-----------------------------
> >  3 files changed, 89 insertions(+), 72 deletions(-)
> > 
> > @@ -2305,6 +2360,11 @@ struct drm_connector {
> >  	 * @cec: CEC-related data.
> >  	 */
> >  	struct drm_connector_cec cec;
> > +
> > +	/**
> > +	 * @writeback: Writeback related valriables.
> > +	 */
> > +	struct drm_writeback_connector writeback;
> 
> No, sorry, that's a bad idea. Most connectors have nothing to do with
> writeback, you shouldn't introduce writeback-specific fields here.
> drm_writeback_connector happens to be a drm_connector because of
> historical reasons (it was decided to reuse the connector API exposed to
> userspace instead of exposing a completely separate API in order to
> simplify the implementation), but that does not mean that every
> connector is related to writeback.
> 
> I don't know what issues the Intel driver(s) have with
> drm_writeback_connector, but you shouldn't make things worse for
> everybody due to a driver problem.

Suraj is trying to solve a problem that in Intel code every drm_connector
must be an intel_connector too. His previous attempt resulted in a loose
abstraction where drm_writeback_connector.base wasn't initialized in
some cases (which is a bad idea IMO).

I know the historical reasons for drm_writeback_connector, but I think
we can do better now.

So, I think, a proper approach would be:

struct drm_connector {
    // other fields

    union {
        struct drm_connector_hdmi hdmi; // we already have it
        struct drm_connector_wb wb;  // this is new
    };

    // rest of the fields.
};

I plan to add drm_connector_dp in a similar way, covering DP needs
(currently WIP).

-- 
With best wishes
Dmitry
