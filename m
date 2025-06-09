Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B15AD2353
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 18:07:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673B210E3F6;
	Mon,  9 Jun 2025 16:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeebxVQI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9682210E3F6
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 16:07:20 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599N4nH012049
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 16:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+qUNrYBBdbGS3K588n15a3kY
 0CudgwuLNgaq06xok2w=; b=AeebxVQIFSYXIjUw8volmoUkk0g7/rGSysTwCnRp
 F+v9rWYratG5A/8n4mAE9aCLxhFJP2Ytwqt6HnFa0Rlrs8IGFJHEEsmNoRPbOeFD
 h4OuYziaGv6R2f2+LYzgia6EYoNs5DZHdSzFj8h4VKE+5c/unmeNES6LSzE2W1CJ
 QwSjGP3nZVobIsI519w6kYg/qYNHKH9hVvduugmWAFXK9aOjg7+RUryvorWbAfwW
 Z2eJTNPQ0VX/0OPJ+CGXJwRR7j8giOBTfgiWOxOLAgyTxGO1DXRfllBTfIrPQ0he
 iJ2VUjqNkrk2AKEr/9PnGZuOZPbnpDYf0CY2xQnB89YLZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekppad8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 16:07:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d097fd7b32so1094165385a.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 09:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749485238; x=1750090038;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+qUNrYBBdbGS3K588n15a3kY0CudgwuLNgaq06xok2w=;
 b=AE/vNeLQXE2psxmKtBv6QbR5porRzZ1iFUwoOT5bpfsxIigP0pCcSQuuAMYDlKNRCr
 /ucutXtzfGEBe0FHYEMkt4nNoMfDmaBBln0wlnBb/sxu9piZsZyQj7wDtnMC9sQDwVzT
 ZH/iRQ/PBXQEpXg1Z1WVYcGfsg6EqFsmcVQluwV0YcQWA0O8Q5CUR0wAB+NKHndPk0gX
 m/lYMNLmSI9zPNpGQjQfdFxdoYmsTHW4msB672kYIulaukiXjBTEVBkuxsdtl4Yo76N+
 RFZlLQX7dUGPr989haC9UxSPfsjKxVB7bWndQ2aOW/ncYtxJCex6c/o+IaOJ4h11rD3Z
 E66Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgP0SAaZzG+hkDj6bfu9IX0iFdRn35v8r4Dis4e2e4YBvQtI1+JNExyN4WTykaw9RawaaF8twf2qU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxf8wmJL8owXLLneOgLLzb8+o7lGS8Ab94BzBQkM6EJMvMF7iA
 ucvcwbxox7LRXYU8vmDu6eB4fEior/PnDmonMFWARxrmLc8i/gORLn2BfJIgKoW9ype0qhN6qIV
 BzWXc9UysyxYlIGq/juc1wF8e8gykNKXLsG0Px0bvR9FVBhzUW2AqUKxgWHPgYhSMSYYmT80=
X-Gm-Gg: ASbGnct/PMV15r6GI1+ywDoObpUGwlKNhF+fwjm5rUhx8zgi1twC9wMIvXy4Yu91jFu
 cOQTF28OtP5utaUXukm2phfyEs8DHEK6gDBvIff6Y2Pnsd5FLMsqPYDi8fi3e5i3al7xv13E4Jy
 24VdZkj3TdDNOO6dooPFjuKqHS/RDquAUrUk5YaHPNEznlvN3+FbTthES9g0mstVsCR0nh1YfuO
 AFjDU12bygCghWskhIaF6sloEkRAHvo7moFAfMV9zRVcp6naREoaURNnTDqhIT/1M/M+CIr6+Ou
 mMLXVIoc6blHlTZBHyeMOFja6psUOypYifZTsxXFgp4l0bCd7BwwTCo929U/7MMfyqiQWU0od4g
 =
X-Received: by 2002:a05:620a:4513:b0:7ca:cd16:8fcb with SMTP id
 af79cd13be357-7d2298d8a80mr1961965785a.37.1749485238156; 
 Mon, 09 Jun 2025 09:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVYJSeoW9tp8i95NtJeZMS8aHF8ENwAwCrE9FAY1YpPN3brqQ/9Ah8IyaKKQghe8Xs6Opplg==
X-Received: by 2002:a05:620a:4513:b0:7ca:cd16:8fcb with SMTP id
 af79cd13be357-7d2298d8a80mr1961962285a.37.1749485237767; 
 Mon, 09 Jun 2025 09:07:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32ae1b347f2sm11561811fa.29.2025.06.09.09.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 09:07:16 -0700 (PDT)
Date: Mon, 9 Jun 2025 19:07:15 +0300
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
Message-ID: <h4zfn52i6jpfbclylgfutdgow7wm2hyl4urtegwcqiw5dkhwef@cfw3fjus4tq5>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684706b7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9hUQRU07m4UGofkZ2RUA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDExOSBTYWx0ZWRfXwsywbSbCafI8
 AQxbpPzL99JrabTQ7A0GKsUo39xxds8U6pR5UwlBjRmnnEI54H1ofhxOOzS/kqmZYElXtDb3i5f
 KVtNgonFy8cD8n4Lan8o/CBp20xXsfOjMfNJRym2XjcXe8mm03ChkOLxBW3b28dT4pqvzy6wGXL
 Tr+B4eAM+7lXPDil4ODV6IHSewH+/GwvJ8vXRVyTr/sphnU0HRXQGfTeJXewadwwlzB7V+8FF5L
 8kWQsbqZPvbFXnA5uLMTYrXAAjPyL8gD1C1ivE5uJ3arMbVrKeVgt2SH6vcYE+5ZeJLhCJdF74u
 z4K7AqcNecv9hR87JqRgz1+lIvmP9Q8iSc67Bw8hShHCRRpYw8NN9iqQ4CAVT7oSkErcdKkmB/L
 a7FjDCDXQqGoOld3CnS+EcKp3vGKRoEUnvhXLNY+7TB96YSBZa/IrNdrHhCDTV4sHvde2Xnh
X-Proofpoint-GUID: WQ9FBLXSdhXrnUY6abH-LPZLdu3xJ8V5
X-Proofpoint-ORIG-GUID: WQ9FBLXSdhXrnUY6abH-LPZLdu3xJ8V5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_06,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090119
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

On Mon, Jun 09, 2025 at 08:21:19PM +0800, Yongxing Mou wrote:
> Add support for Multi-stream transport for MSM chipsets that allow
> a single instance of DP controller to send multiple streams. 
> 
> This series has been validated on sa8775p ride platform using multiple
> MST dongles and also daisy chain method on both DP0 and DP1 upto 1080P.
> 
> With 4x4K monitors, due to lack of layer mixers that combination will not
> work but this can be supported as well after some rework on the DPU side.
> 
> In addition, SST was re-validated with all these changes to ensure there
> were no regressions.
> 
> This patch series was made on top of:
> 
> [1] : https://patchwork.freedesktop.org/seriedds/142010/ (v2 to fix up HPD)
> 
> Bindings for the pixel clock for additional stream is available at :
> 
> [2] : https://patchwork.freedesktop.org/series/142016/
> 
> Overall, the patch series has been organized in the following way:
> 
> 1) First set are a couple of fixes made while debugging MST but applicable
> to SST as well so go ahead of everything else
> 2) Prepare the DP driver to get ready to handle multiple streams. This is the bulk
> of the work as current DP driver design had to be adjusted to make this happen.
> 3) Finally, new files to handle MST related operations
> 
> Validation was done on the latest linux-next on top of above changes and
> both FB console and weston compositors were validated with these changes.

I went about a halfway through the series. During that I noticed ignored
feedback, missing reviewer tags, invalid or strange authorship / SoB
tags, overgrown functions, one line wrappers, etc.

Please rebase on top of [3], review the patch series on your own,
removing / reworking all the bits that can catch my eye, implement the
feedback, ask questions where you don't understand it, etc. After that
please post v3. I'll most likely skip the rest of the patches for now.

[3] https://lore.kernel.org/dri-devel/20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com

-- 
With best wishes
Dmitry
