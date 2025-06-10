Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC2CAD3066
	for <lists+freedreno@lfdr.de>; Tue, 10 Jun 2025 10:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B9D10E493;
	Tue, 10 Jun 2025 08:32:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bEaqjg1a";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 430F810E493
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 08:32:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A82p0X011063
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 08:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=JZrn3vl29ETLeyef2H75LJZ8
 lkv5P66IpdGTrgWehgc=; b=bEaqjg1awy/7I7egSy8etrDgmlBdeP4BmIFkyrfY
 xFealOQ2CNUsbNraFymUckpY12Jebk448A4LgGD9pgCRgb/AJQ+fXATCn0ySSoIW
 UpuwKg7uZC62LzmAik9nZWOKPiyZKR39qXfo2DrMVLBDmI7U89mkbXI4srQmNeAT
 iCy08G8a36Jbwf/M/mTvfU6y1fWgiZch+RGe/M7OceP33oXruxnhMmsnXYeTSgpF
 Z/vJiy3SuSBCX+nfiFkTaYGhFo4NnCv5UfEzHMMGlf4Jw/0wTUrYX4E34+XiEFqI
 Lmfnw/8+DSckF8MC0qJCKdMuiZUMskX6H2z0PK83/7EaCg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxrys0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 08:32:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7cd06c31ad6so925099485a.0
 for <freedreno@lists.freedesktop.org>; Tue, 10 Jun 2025 01:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749544319; x=1750149119;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JZrn3vl29ETLeyef2H75LJZ8lkv5P66IpdGTrgWehgc=;
 b=fRA5IEcT9N2FonDagmXCovp7I+/QgEz7pc34VUNmW5OunV8vxK9TA8vfcevVtKuCmk
 n69oAO0b3YlcbP3aTgLkW/vLocEw8RbHHYY/IlNHliw9ApkmezjkAmIVOp8REhKDaVPW
 5gwJrCuhRrfWNjzIOy9/sJm8GLZ6ZvG9Uo3Zq3QcIql3vVYWSNkNf3c3Y6mTzfzCd2fR
 8SDwwFrhn1KFW65S2hpNJ0IZY+tmDfhofGPO316I07lX1nIsF8uug6MuC4kpAjZlfXOj
 K0Z+a3Jszyj/T8qJVbi9tDXFkYNHFLxwxJLIO+RBpWV1g+ckiDNIk94RP5lmpMuvSR7U
 dMKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoWVV9K1h03ZSP7nI5Rwvj9niRkDMcyGLXeFtGJSv1rrITIwPc+xOeT7TlUnFC1sx+/nGgBS/27yo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRxZnpKd5vLi39nbb2Bnhurg0afTyVrWCoWAkyrNGIViKw0XzY
 dZjjVuH8BMXZN1IGg/h/pDlSTQ2kLaeKgfP1KmPAHD1nAevIDqIEuPMnzSpECZbucDE/PCyGWW+
 2ZY/ljlmwDbo3te1+ZMof4ORdzZ62bJArLMRnmZfBcl8QaQwmL3ShMdJPbGyZd8N3v8PvQKc=
X-Gm-Gg: ASbGncuIZwGD/IQu5ksMs2HEvMT6W7XhDGQk51SbVqhlE4fKj0DD0BYHkVvlsea9H+/
 dr7qzc87V9r0WXexCk8aopzxYOGCPfx1lMx+BO/ANhWIKarWdEExrZsTx4zrr1z8jv/pJsf7AnL
 vqtxJ49jqjtCvQ3jTMPG6iNv281dd84tjXzehcrnSr0dfD6PrHqRuZOxYNDNltIAnDknbkfa2Vi
 YuVc72ipP5IWEpseD7bsnDXl9F9n3O4qwGgxxjlU5z7LJnShQqTk3lShLjDsX0Qowkt0jsz1FkR
 xgvYFGBwtAJNPToDVYJwn/mBRu5galKU+y7ebT8XxVuawlYEHnnO+GNe8dRQhvHdObdCsE/iqqo
 Ff5/qSA4dD/KjMkfFKXEbNGXwefsdcBFW8d0=
X-Received: by 2002:a05:620a:4415:b0:7ce:ea5d:abfb with SMTP id
 af79cd13be357-7d39d8ad67fmr414410785a.12.1749544319531; 
 Tue, 10 Jun 2025 01:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFRon5fmkrg0jRZltDF8NJeGjA/n00qtehYkJGydzz1jCNf65GDG05D22qeb1dd2ENpeasmg==
X-Received: by 2002:a05:620a:4415:b0:7ce:ea5d:abfb with SMTP id
 af79cd13be357-7d39d8ad67fmr414408585a.12.1749544319133; 
 Tue, 10 Jun 2025 01:31:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1cad354sm13794281fa.65.2025.06.10.01.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 01:31:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:31:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 00/38] drm/msm/dp: Add MST support for MSM chipsets
Message-ID: <20250610083155.cag3de7l727zkcxf@umbar.lan>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <h4zfn52i6jpfbclylgfutdgow7wm2hyl4urtegwcqiw5dkhwef@cfw3fjus4tq5>
 <828ebe51-1a02-41e8-b844-2f1ed8410482@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <828ebe51-1a02-41e8-b844-2f1ed8410482@quicinc.com>
X-Proofpoint-GUID: BvUqLLDdH8uUUuQUxy-MlEVELgijfoeT
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6847ed80 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kJDM2j0BT9hQBkDc-9QA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: BvUqLLDdH8uUUuQUxy-MlEVELgijfoeT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA2NCBTYWx0ZWRfX+qDCNDcKOq2y
 hC3iBIsp+E79/SfgVOpPc4PHqXmJuqrWLmCpkGpEW+oxBPfALKowsqQbbc4kEo9lJgrDA/9suvX
 Krql6TEFbFQ5FvfWj/esTeF6otiV5triYNlCfJHbJGtMhgQ9HNyBss3ukotpPDntXsMgPUIAcHq
 J9GB0qt5ZvKR3VMiBvLZWNVhnbewfz0SERlEGA5JsleShgR7regig6pjh+QjBn05VLdMgHIFn+t
 HW4t6ZGUB8Mvj2g+84AxAH9B/tejU6CsYHZnqRQxsd4O6kh59TR9QsTdfjLsD4EtIXiONRp+CvS
 lUulQyefwKvGMp3OmBOF/wskEWlVbWS+hYSYXlWS1RXRfJ/Ucs69Dtf0DortUnP+KlKDTu2yS2n
 CRy24s7JhQhUN/WF/03AFegpOIpA0rbPvG8Y35esdEXnn633eV17l7dLRxXAjXHyLJ+kVsHa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100064
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

On Tue, Jun 10, 2025 at 12:31:40PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/10 0:07, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> > > Add support for Multi-stream transport for MSM chipsets that allow
> > > a single instance of DP controller to send multiple streams.
> > > 
> > > This series has been validated on sa8775p ride platform using multiple
> > > MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> > > 
> > > With 4x4K monitors, due to lack of layer mixers that combination will not
> > > work but this can be supported as well after some rework on the DPU side.
> > > 
> > > In addition, SST was re-validated with all these changes to ensure there
> > > were no regressions.
> > > 
> > > This patch series was made on top of:
> > > 
> > > [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> > > 
> > > Bindings for the pixel clock for additional stream is available at :
> > > 
> > > [2] : https://patchwork.freedesktop.org/series/142016/
> > > 
> > > Overall, the patch series has been organized in the following way:
> > > 
> > > 1) First set are a couple of fixes made while debugging MST but applicable
> > > to SST as well so go ahead of everything else
> > > 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> > > of the work as current DP driver design had to be adjusted to make this happen.
> > > 3) Finally, new files to handle MST related operations
> > > 
> > > Validation was done on the latest linux-next on top of above changes and
> > > both FB console and weston compositors were validated with these changes.
> > 
> > I went about a halfway through the series. During that I noticed ignored
> > feedback, missing reviewer tags, invalid or strange authorship / SoB
> > tags, overgrown functions, one line wrappers, etc.
> > 
> > Please rebase on top of [3], review the patch series on your own,
> > removing / reworking all the bits that can catch my eye, implement the
> > feedback, ask questions where you don't understand it, etc. After that
> > please post v3. I'll most likely skip the rest of the patches for now.
> > 
> > [3] https://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com
> > 
> Hi, Dmitry, thanks for your reviewing very much. Actually i have reviewed
> all the comments on Patch v1. Sorry for not cleaning up everything as
> expected. I will address and discuss all the remaining items in the comments
> for Patch v2, and will follow up with Patch v3 accordingly.

Please discuss the items where they have been raised - either in v1 or
v2 thread.

> 
