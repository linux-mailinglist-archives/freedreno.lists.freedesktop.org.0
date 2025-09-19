Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB2B8AFC2
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 20:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC4310EA74;
	Fri, 19 Sep 2025 18:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RodICOPT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000A910EA76
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:50:36 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JEAm8n029614
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/zVetAH60xiLOOQQabWXMY2i
 CJqLvqOL6orH5OLF1Q8=; b=RodICOPTncKTFzokmFCdDNVaPBJJd6jTyD+ULkYC
 AgRUa2FVVGtGArGXg1DMC62vrdl8/5pxLVdSoHAsbZnuN+DeRZX83Jqb1GPzcTxr
 J1IHk38SJ4JlTHMBE7vJb9Nzz1w2IUfat+WPkiInnAvzev+8IGTWghg65ZKpcTfH
 +VpDg0MGjOnwUd1obLLgo2mPiGn/aShskL7qec3qnHXS2ttLvmbAF0UJws9swRnW
 OJsWBVvH/Jl4jfDjX3Kv6cJehSWn2hprDacPkGnw5GX0nxq1dHTIzj9zoGA+VYBY
 kb4PyzAGIArZkEH9FbNIhatiH5y/DbWkVO854H/++9QDFw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy13g85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:50:36 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5e5f80723so43299551cf.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 11:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307835; x=1758912635;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/zVetAH60xiLOOQQabWXMY2iCJqLvqOL6orH5OLF1Q8=;
 b=H/uAMkaXjg/CcWxYTOXdGXEMWh5DIAu3+4ULx+Kfp34GdqRnYSwmJUK7RCctkMhNgr
 +cZl4NYt1FXrv0Lw2hmROz5DjffisKAoXoTRpWAzPdzd3Q6M7IolrwCzAMbnIn4GjBPP
 L+ta6M+RDrjJdEHAzNs/yzf/W+umCs0J44oUTSfK4SxgcRqTNhQt/KJWKDiHfVblsIby
 T3uvLB+7mzdrwB3r12zHI+psQ6lD2E+5VjoFaIZUGZIPKGLiqny4aECaRIo08hpudcwj
 cTHrP3k8LdPuhQSJeZsLNxp6efMtT+hx3258q01aOkaDGNTh4x3Kzt06F+uqtMstPmt1
 /9PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgcb/XTSJ7+8jCSAzlVLQrP7ol3yvcLTuhlFBkDzV2PIh2Fkfp19teB6uMktGWV87J8VnS/RrNT38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5CLpDutjW5ahy9/ZojAH73LMT4AU3qQE45L2G2bKppzdSxMq2
 y4IcwZWnVVULZ6DbDf0i3ik2SCI2bv51T7FJsdGfDigRQ8ySNqHJV5315EN1VimSmbR6O/40e/h
 lrU1JVLhHOxddxWPFbcWmKKtAOIMuQrQenPJCBBPbOe3j3tPk+oCGfMvNn1Y9FHYA0rkCcGk=
X-Gm-Gg: ASbGncsbFCsL/YU7RHR9L3H3XALhexQfaY1pONCMbXBnadzM0XZ6q7923Wcf2O1lCiO
 aqqk+gLFUS1DHnrhDzTTyxyw6p+/frRVtFT2XnSnl0JrcdtO+TVaJ/ttPXdUlduxhiAHaBtE2qh
 /5tYf8smOmwD0NU0Cx00zXKnsjYHKk8Ui64CMgErGSeHddpZJgIy+o40iQ9l5M+lp1fH+7nt4wp
 7Vbh+BM+I38HYAPvAFfV0PDemGx4LjjejzHXd2LF4QR3t79/Vop7CxERO7+d0H2xUfKO/+stPQ2
 yMQ0yQ/LTRXYL1dpPes2IMkBQlEOqHQGOXUu6g2SF9XbmtmfQ8e6BaMQyDiOJBNGAy6DcHF1LLx
 +TZLRIG8xQ1RrF8rkWWUEx4pcvF9l/U3xJTTQG2q1N4YilV/5zDFi
X-Received: by 2002:ac8:6906:0:b0:4b7:a92a:fbe9 with SMTP id
 d75a77b69052e-4c074a12ea9mr50089951cf.60.1758307834878; 
 Fri, 19 Sep 2025 11:50:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHvM68mI4vWxxDdRyLwlfnUEBZv557Y2SOJBuuYk4+sFrbV9HcLthdAsZ2WBw6KM4yV7CgEg==
X-Received: by 2002:ac8:6906:0:b0:4b7:a92a:fbe9 with SMTP id
 d75a77b69052e-4c074a12ea9mr50089361cf.60.1758307834048; 
 Fri, 19 Sep 2025 11:50:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-361a1e07947sm14292821fa.12.2025.09.19.11.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:50:32 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:50:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH v16 00/10] drm/msm/dpu: Support quad pipe with
 dual-interface
Message-ID: <ibmp5mztq6ykktbtbhhxwvejwtaznr3m32u2t7xz3ujo5akkc3@gvdzchiu47hd>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
 <lkpcsed5wkyztbysmiks5xk3ojr3dw74ef65cpoycclxjmbnsp@5adctm46fc3z>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lkpcsed5wkyztbysmiks5xk3ojr3dw74ef65cpoycclxjmbnsp@5adctm46fc3z>
X-Proofpoint-ORIG-GUID: 0vsSpxV_oMHMbv_Lv9mA28gz4YjyWzJt
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cda5fc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8
 a=TzENwY7SnjuQWjFngvoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 0vsSpxV_oMHMbv_Lv9mA28gz4YjyWzJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3yJgI1Qg8axj
 8++XXrn3L7zdFCaMoUde2oYSyi1jG6ut8TKCAuZnQ9lH59litVnKa2oDD8s2bvVzJd/lMRNeqBw
 idKbMzh81tGVZpck+iC5j9cgPjxo1fQThcp/n/gXakJjpId2cNFmCGlpclBntif46Z/5F5KuFeC
 Mj3mGFoGmCJfP/rD0295ZrF4I+u5JFbhZ8uHhzUUF2T7It732+jH4+JY6a5+MnkXqZvmX4Jn4+5
 9VQxH09CQ2HOrj64xHy/8jtMWmy2c/gYeInFzFut2d3MB+kz7vRRFPBUyYIKXdoYaZPeWlmV5z+
 zPdVk922ASwPMYJH9J3sU60udg0rK1LeogSwWmDFZ+udoKvsgeNgyapFKklptj1AXg7IsJ3Zf21
 HQU3jmY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Fri, Sep 19, 2025 at 03:41:56AM +0300, Dmitry Baryshkov wrote:
> On Thu, Sep 18, 2025 at 09:28:52PM +0800, Jun Nie wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
> > 
> > The first pipe pair co-work with the first mixer pair to cover the left
> > half of screen and 2nd pair of pipes and mixers are for the right half
> > of screen. If a plane is only for the right half of screen, only one
> > or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> > assinged for invalid pipe.
> > 
> > For those panel that does not require quad-pipe, only 1 or 2 pipes in
> > the 1st pipe pair will be used. There is no concept of right half of
> > screen.
> > 
> > For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> > the single SSPP and its multi-rect mode.
> >     
> >     Changes in v16:
> >     - Rebase to latest branch msm-next-lumag.
> >     - Fix IGT test failures.
> >     - Drop patches that have been merged.
> >     - Link to v15: https://lore.kernel.org/r/20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org
> 
> Thanks. It's too invasive and too late for 6.18, but I've started the
> test run at https://gitlab.freedesktop.org/drm/msm/-/merge_requests/191

JFYI: this has passed the IGT testing, so it will be picked up soon
after 6.18-rc1.

-- 
With best wishes
Dmitry
