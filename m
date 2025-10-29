Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395D5C17F7E
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 03:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D268C10E6D6;
	Wed, 29 Oct 2025 02:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6ampo+Z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EBgcHULO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E534710E6D7
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:00:48 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlUWH2525420
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5bzOXYFwaaf6ef1nwwsvGpFG
 6gZ9ZAmal1F522J4MMQ=; b=R6ampo+ZFvsBAF4jHDCSWRHW7XLMIkAVCsvkw3Vx
 p/jWr9sS9uwLn0sW7C9FfQ0CZhMTV5Dnj7NqWLW4dQF7z1p1eYFMy4mhEXcoJLzM
 HZIqEJLYa6ucI8zD4TSrN1K8Ez/JTIwUdGPxKa+97IShOaZkHRkB1KEbBZhYfnFr
 6eyZufooWZkvbWXf83vTJY7577i44wN5xPwlKnKcY85rd9NkkuYu2gX7SqMhn/WV
 rCicL0c4myCD05l3IF/1eR16s+xR8LHX3YZ7X0rYTbIFOSy6p6akQwkuJjamOevL
 nxpHbqoQGzbXAn9q42tl/JH17MI4LfxCiqcST6J99euOWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a3rtnd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 02:00:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8a65ae81248so643147985a.2
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761703247; x=1762308047;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5bzOXYFwaaf6ef1nwwsvGpFG6gZ9ZAmal1F522J4MMQ=;
 b=EBgcHULO41fjW0zeEygLq+n7FqSoGUUEYSyzMMSUDFWvMvsrXL00w5FWDOznmOpSo4
 QEGME1BEzFCYq/WelbpPgpw01T/iBa6QZDwvMLMzM9vCyyZ61FoKYLQCYEGWYEPmNtdo
 0C4AthHsurTzUeNAu4e9IsPWXP5x5mDQx4cZnka7Tu/6mpkVEBPfipTtdsuh49iwqGXf
 YkYFgZmngF1x7nkKhixUGW7/WLBUmRAVbD3miUeU8iYTY7GOQk+c31Hen+Owmh0K5B6w
 yb434HQ1OAGd5uVAhfgOY6tyekO2WaBGq2KaMzf5W6ZArzhUMoCZMjtdIc+yCnVXCz23
 y7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761703247; x=1762308047;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5bzOXYFwaaf6ef1nwwsvGpFG6gZ9ZAmal1F522J4MMQ=;
 b=fixqkywlhe3M2d/J1a31JwFSxlHhM3Z+8zS1sSzMLIIw+BT5LsNYsJs+3I/cFU4CsZ
 hI7HnfBzeUom+UCwLSI41gyVc4ID4hG2nm2BP/53jXCiBSN0cGMnvntE5EO8E1LWxwc3
 x/Y1YqlK7HozmZHIJPudoG6G85hc1CY18iq35hfZXcwHklNfG+O+Tp7gAD1E+t9Ugs5O
 3iyRcG4n1wkxXQCbDu9fAhrZIJcgvfedJgH+xqr8DMPYvOogz3Uy+Uvm4LGTdQFsaWT+
 +CsV1YItmNP3mvVVlRdvPwPPy/WYlmLAAEcKxFWsw3t401nd08aYfS03Z7wjZzjVqHOz
 Q35g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIFHJ57B+UmHMGkUUZlyeDf52mFPdkMXB96e62O7EPgVvnx9RyT3mPbeh5qu4Xq4Lr+J2v+h53TGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh3mTHJ4vO4Tcit9bSWTY8S00aNA1dloWUYMkCR0VNnEG2slnI
 GlqEcab1EymzeKGsUvjbR06UhrqbU3UvB1ERBkMVepV+UU4yzm2WyzraEpPFjlDUAO8+s5yDh5U
 nY5yl/S8TcCIuWQVin3fpZ6XBkzPKWXgyCSjd114AB8W9e5OPDY2jzJEcoTcUk9tjrftgfdU=
X-Gm-Gg: ASbGncvp4EeJUn0+w7qt4b45ztQ80cgGvztNWovg8EavlD3ph8q+QhZKV/+33WMiUQz
 USvZdkkujiRdEooqU4nud6HGRXlLskzs4pNWMu2mZs0mIgNeduIQyqf3Loca1pyOYkHo0yEgUDW
 NgQFSgFKvTeZtRa9OCVtz8iBxwhCvvbPuu1SR1JZrjzo/2ThnHVlro10ifw7zMNRRgwLmgPdGTH
 HCkMIaNKoS9xP2HuNepBovxcP0g4veJxyu6vnVIkSmLgCKeisYaH2kEyIKpGUvetqIOBIlElXbn
 JVM39FXAlOB8scWrk688UtAGC1nrnuBHthf/SHq5i2rYH5mzGsDRRnNT1vzGrkEK6junNFIZ+Eu
 BOtmRytJ8yObw4cxu8iAdLOPI6HoVkCtD0QTnKN6NzCq173ZHgPDTbcbOLrrfUz8d
X-Received: by 2002:a05:620a:4610:b0:89f:9693:2522 with SMTP id
 af79cd13be357-8a8ef62221amr176131585a.73.1761703247218; 
 Tue, 28 Oct 2025 19:00:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRJWEWBjcsXXkAu9QGAiqjDf7yt8PDhra8aQ88qxBQFgifGl7DRhLvxMb2Y2wrCbtbr5g8rw==
X-Received: by 2002:a05:620a:4610:b0:89f:9693:2522 with SMTP id
 af79cd13be357-8a8ef62221amr176124585a.73.1761703246623; 
 Tue, 28 Oct 2025 19:00:46 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-89f24cd592bsm964396885a.18.2025.10.28.19.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 19:00:46 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:00:34 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <aQF1Qp6Lmru2oHC7@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
 <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
 <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
 <2pyurzgalnjwsxqw7qhfguebps45ne6iua7gvioagz554ra6ru@nhe4tnmabqp2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2pyurzgalnjwsxqw7qhfguebps45ne6iua7gvioagz554ra6ru@nhe4tnmabqp2>
X-Proofpoint-ORIG-GUID: i_khzrn9jQMM6ie5xfM2Y8V8aS9ITqDl
X-Authority-Analysis: v=2.4 cv=HM3O14tv c=1 sm=1 tr=0 ts=69017550 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7IK9lZAqeo-zbWUCvDwA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxMyBTYWx0ZWRfX9qnwunUCztBQ
 ZM/ydAiHhu6lDcGeiJ0hjdpBrKbQumsOG1Q4q4XEHVUB5eE5bAAKz6IuBx7mgdEn8W/ts8PIWsT
 xR2Ge/Se2j2k55IDlN8f+9HrN5OClDoNrm8XOsm7LofQ7ViBD7Coj+/vB5J15Z77xv8Es0VEsbU
 5WVplCM4qmJhID0RJbUrCxiHnIHcHOwPp6GYBBps6Jyz9Kj5Z3yLsU6z7kk/GoyD7NaJ5oR5zL/
 Hz+KJrcAhUTBZw2uWmf2eMMX/SRyv+VBtdtyJbggnbma2n3NlXKhobq9IMT+9ZdyCncKNGlH9Wz
 lY+lndOoah1PqAA+ZjaURD/gt0r2nw5Ev++1Y7iYToawZoaUwQUL2ottFTegCApMWjiTlwVuwud
 o/3b5y1oueSHTIwFtg77BE5BS9eWjA==
X-Proofpoint-GUID: i_khzrn9jQMM6ie5xfM2Y8V8aS9ITqDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290013
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

On Mon, Oct 27, 2025 at 03:30:43PM +0200, Dmitry Baryshkov wrote:
> On Fri, Oct 24, 2025 at 02:10:29PM +0800, yuanjiey wrote:
> > On Thu, Oct 23, 2025 at 03:16:31PM +0300, Dmitry Baryshkov wrote:
> > > On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > 
> > > In the subject: DSI, not DSi
> > OK will note.
> > 
> >  
> > > > 
> > > > Add DSI PHY for Kaanapali.
> > > 
> > > Why?
> > 
> > DSI phy for Kaanapali have no significant diiference with previous version(SM8750).
> > But some register change make it imcompatible with previous version(SM8750).
> 
> It's either "no significant difference" or "register change make it
> incompatible". You can't say both.
Sure, will optimize commit message.

Thanks,
Yuanjie
 
> > 
> > I will give this reason in my next patch.
> > 
> > Thanks
> > Yuanjie.
> > 
> 
> -- 
> With best wishes
> Dmitry
